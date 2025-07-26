import 'package:cloud_firestore/cloud_firestore.dart';
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
        return const OperationResult.failure("errors.user_data_empty");
      } else {
        return const OperationResult.failure("errors.user_not_found");
      }
    } catch (e) {
      return const OperationResult.failure("errors.user_fetch_error");
    }
  }
}
