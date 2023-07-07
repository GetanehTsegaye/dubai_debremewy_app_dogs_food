
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
import 'package:dubai_debremewy_app_dogs_food/src/repository/user_repository.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());


  getUserData(){
  final phoneNo = _authRepo.firebaseUser.value?.phoneNumber;
  if(phoneNo!=null){
   return _userRepo.getUserByPhoneNumber(phoneNo);
  } else {
    Get.snackbar('Error', "Login to continue");
  }
  }


  ///Fet
  updateRecord(UserModel user) async{
    await _userRepo.updateUserRecord(user);
  }
}