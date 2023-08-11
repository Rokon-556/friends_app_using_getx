import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FriendController extends GetxController{
  // final  uri = Uri.parse('mailto:smith@example.org');


  Future<void> openGmailApp(Uri url) async {
    if(!await canLaunchUrl(url)){
      await launchUrl(url);
    }else{
      throw 'Could not launch $url';
    }
    // if (!await launchUrl(
    //   url,
    //   mode: LaunchMode.externalApplication,
    // )) {
    //   throw Exception('Could not launch $url');
    // }
  }
}