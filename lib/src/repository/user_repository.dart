import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
   await _db
        .collection('Users')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
              "Success", "Your account has been created Successfully!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try Again!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
  Future<UserModel> getUserByPhoneNumber(String phoneNumber) async {
    final snapshot = await _db.collection('Users').where("Phone Number", isEqualTo: phoneNumber).get();
    final userData = snapshot.docs.map((e) => UserModel.fromUsersDocument(e)).single;
    return userData;

  }
  
}
