import 'package:flutter/material.dart';
import 'package:friends_app/controllers/friend_list_controller.dart';
import 'package:friends_app/views/friend_screen.dart';
import 'package:friends_app/views/widgets/friend_list_widget.dart';
import 'package:get/get.dart';

class FriendListScreen extends GetView<FriendListController> {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friend List'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isDataLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: GridView.builder(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  mainAxisExtent: Get.height / 3.8
                ),
                itemCount: controller.friendList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: ()=>Get.to(()=> FriendScreen(friend:controller.friendList[index])),
                      child: FriendListWidget(friend: controller.friendList[index]));
                },
              ),
            )),
    );
  }
}

// ListView.builder(
// itemCount: controller.friendList.length,
// itemBuilder: (context, index) {
// return InkWell(
// onTap: ()=>Get.to(()=> FriendScreen(friend:controller.friendList[index]!)),
// child: FriendListWidget(friend: controller.friendList[index]));
// },
// ),
