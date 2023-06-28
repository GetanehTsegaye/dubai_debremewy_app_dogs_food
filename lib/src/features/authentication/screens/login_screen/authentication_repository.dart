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
    //Initialized the firebase user. So firebaseUser is the current user who is logged in or logged out
    firebaseUser = Rx<User?>(_auth.currentUser);
    //userChanges is a Stream type which means its always listening to the users action. Is the user hitting the login/logout button
    firebaseUser.bindStream(_auth.userChanges());
    // the ever method is always ready to perform some action
    ever(firebaseUser,
        _setInitialScreen); // so firebaseUser is listening and when something new is happening the _setInitialScreen method should be executed
  }

  // _setInitialScreen(User? user) {
  //   if (user == null) // if the user is null, that means the user is logged out
  //   {
  //     Get.offAll(() => const LoginScreen());
  //   } else // This means that the user has been authenticated and logged in so redirect them to the dashboard
  //   {
  //     Get.offAll(() => const DashboardScreen());
  //   }
  // }

  _setInitialScreen(User? user) async {
    if (user == null) {
      await Future.delayed(Duration(seconds: 4));
       Get.to(()=>  LoginScreen(),
           transition: Transition.fadeIn,
           duration: Duration(seconds: 3));
    } else {
      await Future.delayed(Duration(seconds: 4));
          Get.to(()=>  DashboardScreen(),
          transition: Transition.fadeIn,
          duration: Duration(seconds: 3));

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


  Future<void> signUserIn(String phoneNo) async {
   // String phoneNumber = '+971${phoneNo.text.trim()}'; // Format the phone number

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: this.verificationId.value, // Replace with the verification ID received during OTP verification
          smsCode: '', // Replace with the OTP entered by the user
        ),
      );

      // User is signed in successfully, proceed with your logic
      // ...
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-verification-code') {
          // Handle invalid OTP error
          print('Invalid OTP');
        } else if (e.code == 'credential-already-in-use') {
          // Handle phone number already registered error
          print('Phone number already registered');
          // Show an error message to the user and redirect to the sign-in page
          showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Phone Number Already Registered'),
                content: Text('Please sign in with your phone number instead.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Redirect to the sign-in page
                      // Example: Navigator.pushReplacementNamed(context, '/signin');
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else if (e.code == 'user-not-found') {
          // Handle phone number not registered error
          print('Phone number not registered');
          // Show an error message to the user and redirect to the sign-up page
          showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Phone Number Not Registered'),
                content: Text('Please sign up with your phone number.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Redirect to the sign-up page
                      // Example: Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }
}
