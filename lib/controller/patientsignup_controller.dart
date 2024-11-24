import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sehat_yaab/utils/snackbars.dart';
import 'package:sehat_yaab/view/AuthenticationViews/patient_signin.dart';

class PatientSignUpController extends GetxController {
  late TextEditingController nameController,
      emailController,
      passwordController;
  String? name, email, password;
  RxBool passwordVisible = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "the text field is empty";
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter the email";
    } else if (!GetUtils.isEmail(value)) {
      return "invalid email";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter the password";
    } else if (value.length <= 6) {
      return "password should be at least 6 char";
    }
    return null;
  }

  Future<void> SignUp() async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      if (userCredential.user != null) {
        auth.currentUser!.updateDisplayName(name);
        GetSnackbars.Success("registered succefully", "user registered");
        await Future.delayed(const Duration(milliseconds: 1000),
            () => Get.off(const PatientSignIn()));
      }
    } on FirebaseException catch (e) {
      isLoading.value = false;
      Get.snackbar("Sign Up failed", e.toString());
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("system message", e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
