import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FriendController extends GetxController{

  Future<void> openGmailApp(String recipientEmail) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: recipientEmail,
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }
}