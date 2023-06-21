import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/dashboard_screen/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth
      .instance; // all the authentication related items are now inside the auth variable which is a private variable hence the underscore
// The following User variable
  // -----Will contain the state if the user is logged in or logged out
  // ----- all the values of the user like phonenumber.
  // -----It is not private
  // ----- its type is User
  // ----- We add the question mark because it can be nullable
  //----- It is inside the Stream Rx<> because we want to get the latest values, used to keep users logged in eventhough the app is closed
  //----- And It needs to be initialized so we added the late method
  late final Rx<User?> firebaseUser;
  // The verificationId is type is RxString because its observable, that means when ever there is change inside the verificationId then it will update all its children
  var verificationId =''.obs;

//when ever our application runs, it should check whether the user is logged in or logged out
//if logged in redirect the user to the dashboard
//if logged out redirect the user to the login screen

  @override
  void onReady() {
    // Starts running everytime the application is opened
    firebaseUser = Rx<User?>(_auth
        .currentUser); //Initialized the firebase user. So firebaseUser is the current user who is logged in or logged out
    firebaseUser.bindStream(_auth
        .userChanges()); //userChanges is a Stream type which means its always listening to the users action. Is the user hitting the login/logout button
    // the ever method is always ready to perform some action
    ever(firebaseUser,
        _setInitialScreen); // so firebaseUser is listening and when something new is happening the _setInitialScreen method should be executed
  }

  _setInitialScreen(User? user) {
    if (user == null) // if the user is null, that means the user is logged out
    {
      Get.offAll(() => const LoginScreen());
    } else // This means that the user has been authenticated and logged in so redirect them to the dashboard
    {
      Get.offAll(() => const DashboardScreen());
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      // pass the phoneNo
      phoneNumber: phoneNo,
      // when the verification is completed pass the user credentials, and If it is successful with out asking the user
      // user will be redirected to the next screen
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      // If the verificationCompleted couldnt be sucessfully executed then get the verificationId and alert the user to enter its OTP
      codeSent: (verificationId, resendToken) {
        // we called the .value because the this.verificationId is an RxString defined on the top
        this.verificationId.value=verificationId;
      },

      //This will resend the verification code after some time of interval
      codeAutoRetrievalTimeout: (verificationId) {
        // we called the .value because the this.verificationId is an RxString defined on the top
        this.verificationId.value=verificationId;
      },
      // pass the exception e
      verificationFailed: (e) {
        if(e.code =="invalid-phone-number"){
          Get.snackbar('Error', 'The provided phone number is not valid.');
        } else {
          Get.snackbar('Error', 'Something is wrong, please Try again.');
          print(e.code);
        }
      },
    );
  }
// the following will be called when the user types the OTp
  Future<bool> verifyOTP(String otp)async{
   var credentials= await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
   // If the credentials.user is not equal to null that means the user is logged in then return true else return false
return credentials.user !=null ? true : false;

  }

  Future<void> logout() async => await _auth.signOut();
}
