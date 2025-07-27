import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/core/models/user/user_model.dart';
import 'package:magicchat/core/networking/operation_result.dart';

class UserRepository {
  final FirebaseFirestore firestore;

  UserRepository({required this.firestore});

  Future<OperationResult<UserModel>> getUserData(String phone) async {
    try {
      final docSnapshot = await firestore.collection('users').doc(phone).get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null) {
          return OperationResult.success(UserModel.fromJson(data));
        }
        return  OperationResult.failure("errors.user_data_empty".tr());
      } else {
        return  OperationResult.failure("errors.user_not_found".tr());
      }
    } catch (e) {
      return  OperationResult.failure("errors.user_fetch_error".tr());
    }
  }
}
