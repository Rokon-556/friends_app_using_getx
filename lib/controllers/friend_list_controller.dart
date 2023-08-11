import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:friends_app/models/friend_list_model.dart';
import 'package:get/get.dart';

class FriendListController extends GetxController {
  RxBool isDataLoading = false.obs;
  List<Result> friendList = <Result>[];
  var users = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    // fetchRandomUsers();
    makeApiCalls(10);

  }

  Future<void> getFriendList() async {
    isDataLoading.value = true;
      const url = 'https://randomuser.me/api/';
      final dio = Dio();
      final response = await dio.get(url);

       try {
         if (response.statusCode == 200) {
           var data = response.data['results'] as List<dynamic>;
           log('friend:$data');
           if (data.isNotEmpty) {
             for (var friend in data) {
               friendList.add(Result.fromJson(friend));
             }
           }
           isDataLoading.value = false;
         }
         isDataLoading.value = false;
       } catch (e) {
         log(e.toString());
     }
    log("friendList:${friendList.length}");
  }

  Future<void> fetchRandomUsers() async {
    try {
      isDataLoading.value =true;
      final dio = Dio();
      final response = await dio.get('https://randomuser.me/api/?results=10');
      final results = response.data['results'] as List<dynamic>;
      log('friend:$results');
      final List<Result> userList = results.map((user) => Result.fromJson(user)).toList();
      users.value = userList;
      isDataLoading.value = false;
    } catch (error) {
      log('Error fetching users: $error');
    }
  }


  Future<void> makeApiCalls(int times) async {
    for (int i = 0; i < times; i++) {
      await getFriendList();
    }
  }
}
