import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class UserModel {
  final String? id;
  final String fullName;
  final int gender;
  final String phoneNo;
  final int maritalStatus;
  final String churchLocation;

  const UserModel({
    this.id,
    required this.fullName,
    required this.gender,
    required this.phoneNo,
    required this.maritalStatus,
    required this.churchLocation,
  });

  // convert the above model to json

  toJson() {
    return {
      "FullName": fullName,
      "Gender": gender,
      "Phone Number": phoneNo,
      "Marital Status": maritalStatus,
      "Church Location": churchLocation
    };
  }

  factory UserModel.fromUsersDocument(DocumentSnapshot<Map<String, dynamic>>returnedUsersDocument){
   final userData = returnedUsersDocument.data()!;
    return UserModel(
        fullName: userData["FullName"],
        gender: userData["Gender"],
        phoneNo: userData["Phone Number"],
        maritalStatus: userData["Marital Status"],
        churchLocation: userData["Church Location"]);
  }

}
