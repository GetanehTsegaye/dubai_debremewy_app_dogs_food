import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class UserModel {
  final String? id;
  final String? profilePicutreUrl;
  final String fullName;
  final int gender;
  final String phoneNo;
  final int maritalStatus;
  final String churchLocation;

  final String? email;
  final String? christianName;
  final String? spiritualFathersName;
  final String? mahiberName;
  final String? educationalLevel;
  final String? occupationType;
  final String? visaType;

  const UserModel({
    this.id,
    this.profilePicutreUrl,
    required this.fullName,
    required this.gender,
    required this.phoneNo,
    required this.maritalStatus,
    required this.churchLocation,

    this.email,
    this.christianName,
    this.spiritualFathersName,
    this.mahiberName,
    this.educationalLevel,
    this.occupationType,
    this.visaType

  });

  // convert the above model to json

  toJson() {
    return {
      "Profile Picture URL":profilePicutreUrl,
      "FullName": fullName,
      "Gender": gender,
      "Phone Number": phoneNo,
      "Marital Status": maritalStatus,
      "Church Location": churchLocation,

     "Email": email,
      "Christian Name":christianName,
     "Spiritual Father Name": spiritualFathersName,
      "Mahiber Name": mahiberName,
      "Educational Level": educationalLevel,
      "Occupation Type": occupationType,
      "Visa Type": visaType,
    };
  }

  factory UserModel.fromUsersDocument(DocumentSnapshot<Map<String, dynamic>>returnedUsersDocument){
   final userData = returnedUsersDocument.data()!;
    return UserModel(
        id: returnedUsersDocument.id,
        profilePicutreUrl: userData["Profile Picture URL"],
        fullName: userData["FullName"],
        gender: userData["Gender"],
        phoneNo: userData["Phone Number"],
        maritalStatus: userData["Marital Status"],
        churchLocation: userData["Church Location"],

      email:userData["Email"],
      christianName: userData["Christian Name"],
      spiritualFathersName:userData["Spiritual Father Name"],
      mahiberName:userData["Mahiber Name"],
      educationalLevel:userData["Educational Level"],
      occupationType:userData["Occupation Type"],
      visaType:userData["Visa Type"],



    );
  }

}
