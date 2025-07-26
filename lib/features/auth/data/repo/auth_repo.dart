// 📁 auth_repository.dart
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:magicchat/core/helpers/shared_pref_helper.dart';
import 'package:magicchat/core/networking/operation_result.dart';
import 'package:magicchat/core/models/user/user_model.dart';

class AuthRepository {
  final FirebaseFirestore firestore;

  AuthRepository({required this.firestore});

  Future<UserModel?> getUserIfExists(String phoneNumber) async {
    final doc = await firestore.collection("users").doc(phoneNumber).get();
    if (!doc.exists) return null;
    return UserModel.fromJson(doc.data()!);
  }

  Future<void> markUserAsLoggedIn(String phoneNumber) async {
    await firestore.collection("users").doc(phoneNumber).update({
      "isLoggedIn": true,
    });
  }

  Future<OperationResult<UserModel>> saveUserToFirestore({
    required String phoneNumber,
    required String username,
    required File? imageFile,
  }) async {
    try {
      final doc = await firestore.collection("users").doc(phoneNumber).get();
      if (doc.exists) {
        return const OperationResult.failure("هذا الرقم مستخدم بالفعل.");
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
      return OperationResult.failure("خطأ أثناء حفظ البيانات: $e");
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

  Future<bool> checkIfUserLoggedIn() async {
    final cachedPhone = await SharedPrefHelper.getString('user_phone');

    final doc = await firestore.collection("users").doc(cachedPhone).get();
    return doc.exists && doc.data()?['isLoggedIn'] == true;
  }

  Future<void> logout() async {
    try {
      final cachedPhone = await SharedPrefHelper.getString('user_phone');
      print('Logging out user: $cachedPhone');
      await firestore.collection("users").doc(cachedPhone).update({
        "isLoggedIn": false,
      });
    } catch (e) {
      print('Error updating Firestore: $e');
      rethrow;
    }
  }
}
