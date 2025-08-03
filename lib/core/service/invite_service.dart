import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class InviteService {
  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static Future<void> sendInviteSms(String phoneNumber) async {
    final message = 'friends.invite_message'.tr();
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      query: encodeQueryParameters(<String, String>{
        'body': message,
      }),
    );

    try {
      if (!await launchUrl(smsUri)) {
        throw Exception('Could not launch SMS app');
      }
    } catch (e) {
      // يمكن هنا تعرض رسالة خطأ أو تسجيله
      print('Error sending invite SMS: $e');
      rethrow;
    }
  }
}
