import 'package:friends_app/controllers/friend_list_controller.dart';
import 'package:get/get.dart';

class FriendListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FriendListController());
  }
}