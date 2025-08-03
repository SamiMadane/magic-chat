import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magicchat/core/networking/operation_result.dart';
import 'package:magicchat/features/friends/data/model/friends_contact_model.dart';

class FriendsRepository {
  final FirebaseFirestore firestore;

  FriendsRepository({required this.firestore});

  /// جلب جهات الاتصال من الجهاز وتحويلها إلى FriendsContactModel
  Future<List<FriendsContactModel>> getDeviceContacts() async {
    final hasPermission = await FlutterContacts.requestPermission();
    if (!hasPermission) {
      throw Exception('Contacts permission denied');
    }

    final contacts = await FlutterContacts.getContacts(withProperties: true);
    return contacts.map((c) {
      final phone = c.phones.isNotEmpty ? c.phones.first.number : null;
      return FriendsContactModel(
        id: c.id,
        username: c.displayName,
        phone: phone,
        isAppUser: false, // سيتم تحديده لاحقًا
      );
    }).toList();
  }

  /// إرجاع قائمة جهات الاتصال مع تحديد من يستخدم التطبيق
  Future<OperationResult<List<FriendsContactModel>>>
      getContactsWithAppStatus() async {
    try {
      final contacts = await getDeviceContacts();

      // جلب كل المستخدمين في التطبيق (رقم الهاتف = document ID)
      final snapshot = await firestore.collection('users').get();
      final appUserPhones = snapshot.docs.map((doc) => doc.id).toSet();

      final updatedContacts = contacts.map((contact) {
  bool isAppUser = false;
  if (contact.phone != null) {
    final possibleNumbers = _getPossibleNormalizedNumbers(contact.phone!);
    isAppUser = possibleNumbers.any((normalized) => appUserPhones.contains(normalized));
  }
  return contact.copyWith(isAppUser: isAppUser);
}).toList();

      return OperationResult.success(updatedContacts);
    } catch (e) {
      return OperationResult.failure(e.toString());
    }
  }

 Future<OperationResult<List<FriendsContactModel>>> searchUserByPhone(
    String phoneNumber) async {
  try {
    final List<FriendsContactModel> results = [];

    if (phoneNumber.startsWith('+')) {
      final user = await _searchByExactPhone(phoneNumber);
      if (user != null) {
        results.add(user);
      } else {
        results.add(createNotAppUserModel(phoneNumber));
      }
    } else {
      final possibleNumbers = _getPossibleNormalizedNumbers(phoneNumber);
      bool foundUser = false;

      for (final number in possibleNumbers) {
        final user = await _searchByExactPhone(number);
        if (user != null) {
          results.add(user);
          foundUser = true;
        }
      }

      if (!foundUser) {
        results.add(createNotAppUserModel(phoneNumber));
      }
    }

    return OperationResult.success(results);
  } catch (e) {
    return OperationResult.failure(e.toString());
  }
}


  FriendsContactModel createNotAppUserModel(String phoneNumber) {
    return FriendsContactModel(
      id: phoneNumber,
      username: 'friends.search.unknown_user'.tr(),
      phone: phoneNumber,
      imageUrl: null,
      isAppUser: false,
    );
  }

  Future<FriendsContactModel?> _searchByExactPhone(String phone) async {
    final doc = await firestore.collection('users').doc(phone).get();
    if (doc.exists) {
      final data = doc.data()!;
      return FriendsContactModel(
        id: doc.id,
        username: data['username'],
        phone: data['phone'],
        imageUrl: data['imageUrl'],
        isAppUser: true,
      );
    }
    return null;
  }

  List<String> _getPossibleNormalizedNumbers(String phoneNumber) {
    final cleaned = phoneNumber.replaceAll(RegExp(r'\s+|\-'), '');
    final normalized = cleaned.startsWith('0') ? cleaned.substring(1) : cleaned;

    return [
      '+970$normalized',
      '+972$normalized',
    ];
  }
}
