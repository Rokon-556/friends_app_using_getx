import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:friends_app/models/friend_list_model.dart';
import 'package:get/get.dart';

class FriendListController extends GetxController {
  RxBool isDataLoading = false.obs;
  var friendList = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFriendList();
  }

  Future<void> getFriendList() async {
    try {
      isDataLoading.value =true;
      final dio = Dio();
      final response = await dio.get('https://randomuser.me/api/?results=10');
      final results = response.data['results'] as List<dynamic>;
      log('friend:$results');
      final List<Result> userList = results.map((user) => Result.fromJson(user)).toList();
      friendList.value = userList;
      log('user value:${friendList.length}');
      isDataLoading.value = false;
    } catch (error) {
      log('Error fetching users: $error');
    }
  }
}
