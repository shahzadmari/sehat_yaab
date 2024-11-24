import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sehat_yaab/utils/snackbars.dart';
import 'package:sehat_yaab/view/DoctorViews/doctor_bottomNavigation.dart';

class DoctorSignInController extends GetxController {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late FirebaseAuth auth;
  final GetStorage storage =
      GetStorage(); //GetStorage is a global variable you can access it's key, values anywhere by intializing this object
  RxBool? isLoading;
  String? email,
      password; //variables for storing text editing controllers values
  //RxBool isFirstTime = true.obs;
  //a variable used for session management
  // final TextEditingController _confrimPassword = TextEditingController();

  //Authcontroller controller = Get.put(Authcontroller());
  RxBool passwordVisible = false.obs;
  var userType;
  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    auth = FirebaseAuth.instance;
    isLoading = false.obs;
    userType = storage.read('userType') ?? '';
    //  isFirstTime = storage.read('isFirstTime') ?? true.obs;
    // fetching from global variable whether the user is logged in or not
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter the email";
    } else if (value.contains('@') == false) {
      return "invalid email";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter the password";
    } else if (value.length < 6) {
      return "password should be at least 6 char";
    }
    return null;
  }

  Future<void> signIn() async {
    try {
      isLoading!.value = true;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      if (userCredential.user != null) {
        storage.write('isLoggedIn', true);
        storage.write('userType', "doctor");
        GetSnackbars.Success(
            "SignIn successfull", "user sign in without any issue");
        await Future.delayed(const Duration(milliseconds: 1000),
            () => Get.to(const DoctorBottomNavigationScreen()));
        Get.delete<DoctorSignInController>();
      }
    } on FirebaseException catch (e) {
      isLoading!.value = false;
      GetSnackbars.failure("Firebase Error", e.toString());
    } catch (e) {
      isLoading!.value = false;
      GetSnackbars.failure("Error", e.toString());
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    storage.write('isLoggedIn', false);
  }

  @override
  void onClose() {
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
  }
}
