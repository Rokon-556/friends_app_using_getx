import 'package:get/get.dart';

import '../controllers/friend_controller.dart';

class FriendBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FriendController());
    // Get.lazyPut<FriendController>(() => FriendController());
  }
}