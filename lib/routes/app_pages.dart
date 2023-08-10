import 'package:friends_app/routes/app_routes.dart';
import 'package:friends_app/views/friend_screen.dart';
import 'package:friends_app/views/friends_list_screen.dart';
import 'package:get/get.dart';

import '../bindings/friend_binding.dart';
import '../bindings/friend_list_binding.dart';

class AppPages{
  static var list = [
    GetPage(
      name: AppRoutes.friend_list_screen,
      page: () =>  const FriendListScreen(),
      binding: FriendListBinding(),
    ),
    GetPage(
      name: AppRoutes.friend_screen,
      page: () => const FriendScreen(),
      binding: FriendBinding(),
    ),
  ];
}