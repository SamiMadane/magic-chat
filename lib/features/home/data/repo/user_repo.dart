import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magicchat/features/home/data/model/user_model.dart';

class UserRepository {
  final FirebaseFirestore firestore;

  UserRepository({required this.firestore});

  /// جلب بيانات المستخدم من Firestore حسب رقم الهاتف
  Future<UserModel?> getUserData(String phone) async {
    try {
      final docSnapshot = await firestore.collection('users').doc(phone).get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null) {
          // تحويل البيانات إلى UserModel باستخدام fromJson
          return UserModel.fromJson(data);
        }
      }
      return null; // لا توجد بيانات للمستخدم
    } catch (e) {
      print('Error fetching user data: $e');
      rethrow;
    }
  }
}
