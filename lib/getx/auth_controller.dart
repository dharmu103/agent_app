import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/screens/authscreens/otp_screen.dart';
import 'package:workerkhojo_agent_panel/screens/authscreens/signup_screen.dart';
import 'package:workerkhojo_agent_panel/screens/home_screen.dart';
import 'package:workerkhojo_agent_panel/screens/onboarding_screen.dart';
import 'package:workerkhojo_agent_panel/widgets/toast.dart';

import '../screens/profile/view_profile_screen.dart';

class AuthController extends GetxController {
  var phoneFormKey = GlobalKey<FormState>();
  var signupFormKey = GlobalKey<FormState>();

  RxBool isverifing = false.obs;
  TextEditingController phoneTextController = TextEditingController();

  TextEditingController fullnameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController refercodeTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController otpTextController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verId;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // this function is called when the agents clicks on the submit phone number button
  sendOtp() async {
    try {
      await _auth
          .verifyPhoneNumber(
              phoneNumber: '+91${phoneTextController.text}',
              timeout: const Duration(seconds: 60),
              verificationCompleted: verificationCompleted,
              verificationFailed: verificationFailed,
              codeSent: codeSent,
              codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
          .then((value) => Get.to(const OtpScreen()));
    } on FirebaseAuthException catch (e) {
      toast(e.message, Colors.red);
    } catch (e) {
      toast(e, Colors.red);
    }
  }

  resendOtp() {
    try {} catch (e) {
      toast(e, Colors.red);
    }
  }

// auto verify phone number function for firebase auth and firestore database
  verificationCompleted(AuthCredential credential) {
    _auth
        .signInWithCredential(credential)
        .then((value) => {
              storage.write(
                  key: 'key',
                  value: FirebaseAuth.instance.currentUser?.phoneNumber
                      .toString()),
            })
        .then((value) => getUserDetail());
  }

// onVerificationFailed function is called when the verification process failed
  verificationFailed(FirebaseAuthException exception) {
    toast(exception.message, Colors.red);
  }

// autoretrieval timeout for the verification code
  codeAutoRetrievalTimeout(String verificationId) {
    null;
  }

// codesent is called when the code is sent to the agents
  codeSent(String verificationId, int? forceResendingToken) {
    verId = verificationId;
  }

  // verifyOtp is called when the agents not automatically verified
  verifyOtp(otp) async {
    isverifing = true.obs;

    try {
      await _auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verId.toString(), smsCode: otp))
          .then((value) => isverifing = false.obs);
    } on FirebaseAuthException catch (e) {
      toast(e.message, Colors.red);

      isverifing = false.obs;
      update();
    } catch (e) {
      isverifing = false.obs;
      update();
      toast(e, Colors.red);
    }

    if (_auth.currentUser != null) {
      storage
          .write(
              key: 'key',
              value: FirebaseAuth.instance.currentUser?.phoneNumber.toString())
          .then((value) => getUserDetail());
    }
  }

// create agents Profile
  createProfile() {
    try {
      _firestore
          .collection('agents')
          .doc(FirebaseAuth.instance.currentUser?.phoneNumber.toString())
          .set({
            'name': fullnameTextController.text.toString(),
            'email': emailTextController.text.toString(),
            'city': cityTextController.text.toString(),
            'refercode': '+91${refercodeTextController.text.toString()}',
            'phone': FirebaseAuth.instance.currentUser?.phoneNumber.toString(),
          })
          .then((value) =>
              _auth.currentUser!.updateDisplayName(fullnameTextController.text))
          .then((value) => getUserDetail());
    } catch (e) {
      toast(e, Colors.red);
    }
  }

// logout function
  logout() {
    _auth.signOut();
    storage.deleteAll();
    Get.offAll(const OnBoardingScreen());
    toast('logout sucessfully', Colors.green);
  }

//  get agents detail to check if agents is First Time User
  getUserDetail() async {
    try {
      await _firestore
          .collection('agents')
          .doc('${FirebaseAuth.instance.currentUser?.phoneNumber}')
          .get()
          .then((value) => {
                if (value.exists)
                  {
                    Get.offAll(const HomeScreen()),
                  }
                else
                  {
                    Get.offAll(const SignupScreen()),
                  }
              });
    } catch (e) {
      toast(e, Colors.red);
    }
  }

  isAlreadyLoggedIn() async {
    var phoneNumber = await storage.read(key: 'key');
    try {
      if (phoneNumber != null) {
        getUserDetail();
      } else {
        Get.offAll(const OnBoardingScreen());
      }
    } catch (e) {
      toast(e, Colors.red);
    }
  }
}
