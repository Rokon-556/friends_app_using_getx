import 'package:flutter/material.dart';
import 'package:friends_app/bindings/friend_list_binding.dart';
import 'package:friends_app/routes/app_pages.dart';
import 'package:friends_app/routes/app_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friends',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0XFFFF8C1A),
          centerTitle: true,
        ),
        // primaryColor: const Color(0XFFFF8C1A),
      ),
      initialRoute: AppRoutes.friend_list_screen,
      initialBinding: FriendListBinding(),
      getPages: AppPages.list,
    );
  }
}
