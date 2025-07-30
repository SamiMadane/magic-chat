import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:magicchat/features/user/data/model/user_model.dart';
import 'package:magicchat/core/networking/operation_result.dart';
import 'package:magicchat/core/helpers/shared_pref_helper.dart';

class UserRepository {
  final FirebaseFirestore firestore;

  UserRepository({required this.firestore});

  /// جلب بيانات المستخدم حسب رقم الهاتف المخزن
  Stream<OperationResult<UserModel>> getUserDataByPhone() async* {
    try {
      final phone = await SharedPrefHelper.getString('user_phone');
      // ignore: unnecessary_null_comparison
      if (phone == null || phone.isEmpty) {
        yield OperationResult.failure("errors.phone_not_found".tr());
        return;
      }

      yield* firestore
          .collection('users')
          .doc(phone)
          .snapshots()
          .map((docSnapshot) {
        if (docSnapshot.exists) {
          final data = docSnapshot.data();
          if (data != null) {
            return OperationResult.success(UserModel.fromJson(data));
          } else {
            return OperationResult.failure("errors.user_data_empty".tr());
          }
        } else {
          return OperationResult.failure("errors.user_not_found".tr());
        }
      });
    } catch (e) {
      yield OperationResult.failure("errors.user_fetch_error".tr());
    }
  }

  /// تحديث اسم المستخدم وصورته
  Future<OperationResult<void>> updateUserProfile({
    required String phone,
    required String newName,
    File? newImage,
  }) async {
    try {
      String? imageUrl;

      if (newImage != null) {
        imageUrl = await uploadImageToCloudinary(newImage.path);
      }

      final dataToUpdate = {
        'username': newName,
        if (imageUrl != null) 'image': imageUrl,
      };

      await firestore.collection('users').doc(phone).update(dataToUpdate);
      return const OperationResult.success(null);
    } catch (e) {
      return OperationResult.failure("errors.user_update_error".tr());
    }
  }

  /// رفع صورة إلى Cloudinary
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
        'Error uploading image: ${result['error']['message'] ?? result['error']}',
      );
    }
  }
}
