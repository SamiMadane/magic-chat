import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/core/networking/operation_result.dart';
import 'package:magicchat/features/user/data/model/user_model.dart';

class AuthRepository {
  final FirebaseFirestore firestore;

  AuthRepository({required this.firestore});

  Future<OperationResult<UserModel?>> getUserIfExists(
      String phoneNumber) async {
    try {
      final doc = await firestore.collection("users").doc(phoneNumber).get();

      if (!doc.exists) {
        return OperationResult.success(null);
      }

      final data = doc.data();
      if (data == null) {
        return OperationResult.failure("errors.user_data_empty".tr());
      }

      final user = UserModel.fromJson(data);
      return OperationResult.success(user);
    } catch (e, stack) {
      print('Error fetching user: $e');
      print(stack);
      return OperationResult.failure("errors.user_fetch_error".tr());
    }
  }

  Future<OperationResult<void>> markUserAsLoggedIn(String phoneNumber) async {
    try {
      await firestore.collection("users").doc(phoneNumber).update({
        "isLoggedIn": true,
      });
      return const OperationResult.success(null);
    } catch (e) {
      return OperationResult.failure("errors.unexpected".tr());
    }
  }

  Future<OperationResult<UserModel>> saveUserToFirestore({
    required String phoneNumber,
    required String username,
    required File? imageFile,
  }) async {
    try {
      final doc = await firestore.collection("users").doc(phoneNumber).get();
      if (doc.exists) {
        return OperationResult.failure("errors.user_already_exists"
            .tr()); // اضف المفتاح الجديد في ملف اللغات
      }

      String imageUrl = 'https://cdn-icons-png.flaticon.com/512/149/149071.png';
      if (imageFile != null) {
        imageUrl = await uploadImageToCloudinary(imageFile.path);
      }

      final user = UserModel(
        phone: phoneNumber,
        username: username,
        imageUrl: imageUrl,
        isLoggedIn: true,
      );

      await firestore.collection("users").doc(phoneNumber).set(user.toJson());
      await SharedPrefHelper.setData('user_phone', phoneNumber);

      return OperationResult.success(user);
    } catch (e) {
      return OperationResult.failure("errors.unexpected".tr());
    }
  }

  Future<String> uploadImageToCloudinary(String imagePath) async {
    final url =
        Uri.parse('https://api.cloudinary.com/v1_1/dmhmhyigi/image/upload');

    final uploadRequest = http.MultipartRequest('POST', url);
    uploadRequest.fields['upload_preset'] = 'leuko_care';

    final imageBytes = await File(imagePath).readAsBytes();
    final imageFile = http.MultipartFile.fromBytes(
      'file',
      imageBytes,
      filename: 'image.jpg',
    );

    uploadRequest.files.add(imageFile);

    final response = await uploadRequest.send();
    final responseData = await response.stream.toBytes();
    final result = json.decode(String.fromCharCodes(responseData));

    if (response.statusCode == 200) {
      return result['secure_url'];
    } else {
      throw Exception(
          'Error uploading image: ${result['error']['message'] ?? result['error']}');
    }
  }

  Future<OperationResult<bool>> checkIfUserLoggedIn() async {
    try {
      final cachedPhone = await SharedPrefHelper.getString('user_phone');
      if (cachedPhone.isEmpty) {
        return const OperationResult.success(false);
      }

      final doc = await firestore.collection("users").doc(cachedPhone).get();
      if (!doc.exists) {
        return const OperationResult.success(false);
      }

      final isLoggedIn = doc.data()?['isLoggedIn'] == true;
      return OperationResult.success(isLoggedIn);
    } catch (e) {
      return OperationResult.failure("errors.unexpected".tr());
    }
  }

  Future<OperationResult<void>> logout() async {
    try {
      final cachedPhone = await SharedPrefHelper.getString('user_phone');
      if (cachedPhone.isEmpty) {
        return OperationResult.failure("errors.user_not_found".tr());
      }

      await firestore.collection("users").doc(cachedPhone).update({
        "isLoggedIn": false,
      });

      return const OperationResult.success(null);
    } catch (e) {
      return OperationResult.failure("errors.unexpected".tr());
    }
  }
}
