// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/models/agent_model.dart';
import 'package:workerkhojo_agent_panel/screens/authscreens/otp_screen.dart';
import 'package:workerkhojo_agent_panel/screens/authscreens/signup_screen.dart';
import 'package:workerkhojo_agent_panel/screens/btmnav.dart';
import 'package:workerkhojo_agent_panel/screens/onboarding_screen.dart';
import 'package:workerkhojo_agent_panel/widgets/toast.dart';

class AuthController extends GetxController {
  var phoneFormKey = GlobalKey<FormState>();
  var signupFormKey = GlobalKey<FormState>();
  final randomId = Random().nextInt(1000000);

  RxBool isverifing = false.obs;
  TextEditingController phoneTextController = TextEditingController();

  TextEditingController fullnameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController aadharnoTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController otpTextController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verId;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static AgentModel agentModel = AgentModel();
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
          .collection('agents1')
          .doc('Ag-${randomId}')
          .set({
            'agentId': randomId.toString(),
            'name': fullnameTextController.text.toString(),
            'email': emailTextController.text.toString(),
            'aadharno': aadharnoTextController.text.toString(),
            'isVerified': false,
            'city': cityTextController.text.toString(),
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
          .collection('agents1')
          .where('phone',
              isEqualTo: FirebaseAuth.instance.currentUser?.phoneNumber)
          .limit(1)
          .get()
          .then((value) => {
                if (value.docs.isNotEmpty)
                  {
                    Get.offAll(const BottomNav()),
                    storage.write(
                        key: 'agentId',
                        value: value.docs.first.data()['agentId'].toString()),
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

  randomAlphaNumeric(int i) {
    var rng = Random();
    var n = rng.nextInt(i);
    var n1 = rng.nextInt(i);
    var n2 = rng.nextInt(i);
    var n3 = rng.nextInt(i);
    var n4 = rng.nextInt(i);
    var n5 = rng.nextInt(i);
    var n6 = rng.nextInt(i);
    var n7 = rng.nextInt(i);
    var n8 = rng.nextInt(i);
    var n9 = rng.nextInt(i);
    var n10 = rng.nextInt(i);
    return '${n}${n1}${n2}${n3}${n4}${n5}${n6}${n7}${n8}${n9}${n10}';
  }
}
