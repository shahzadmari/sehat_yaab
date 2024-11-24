import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sehat_yaab/controller/patientsignin_controller.dart';
import 'package:sehat_yaab/view/AuthenticationViews/doctor_signIn.dart';
import 'dart:math' as math;

import 'package:sehat_yaab/view/AuthenticationViews/patient_signup.dart';

class PatientSignIn extends StatelessWidget {
  const PatientSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final scontroller = Get.put(PatientSignInController());
    final SignInformKey = GlobalKey<FormState>();
    return Obx(() => Container(
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Column(
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 10.0),
                              child: Text(
                                "Sehat Sab Ke liye",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Form(
                          key: SignInformKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: scontroller.emailController,
                                  cursorColor: const Color(0xFF2C3E50),
                                  cursorWidth: 1.0,
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                    hintText: "yourEmail@email.com",
                                    border: InputBorder.none,
                                  ),
                                  onSaved: (newValue) {
                                    scontroller.email = newValue;
                                  },
                                  validator: (value) {
                                    return scontroller.emailValidator(value);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: scontroller.passwordController,
                                  obscureText:
                                      !scontroller.passwordVisible.value,
                                  cursorColor: const Color(0xFF2C3E50),
                                  cursorWidth: 1.0,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    hintText: "••••••••",
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                      splashRadius: 10,
                                      icon: Icon(
                                        scontroller.passwordVisible.isTrue
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xFF8E9EAB),
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        scontroller.passwordVisible.value =
                                            !scontroller.passwordVisible.value;
                                      },
                                    ),
                                  ),
                                  onSaved: (newValue) {
                                    scontroller.password = newValue;
                                  },
                                  validator: (value) {
                                    return scontroller.passwordValidator(value);
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: CupertinoButton(
                                  padding: const EdgeInsets.only(right: 5),
                                  onPressed: () {},
                                  child: const Text(
                                    "Recover Password",
                                    style: TextStyle(
                                      color: Color(0xFF2C3E50),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: CupertinoButton(
                                color: const Color(0xFF2C3E50),
                                onPressed: () {
                                  if (SignInformKey.currentState!.validate()) {
                                    SignInformKey.currentState!.save();
                                    scontroller.signIn();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: scontroller.isLoading!.value
                                      ? const CircularProgressIndicator()
                                      : const Text("Sign In"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 30.0,
                                horizontal: 10.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Transform.rotate(
                                      angle: math.pi,
                                      child: Container(
                                        height: 1,
                                        decoration: const BoxDecoration(
                                            //  gradient: gradeGrey,
                                            // color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const Text(
                                    "Or continue with",
                                    style: TextStyle(
                                      color: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      decoration: const BoxDecoration(
                                          //gradient: gradeGrey,
                                          // color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: CupertinoButton(
                                color: const Color(0xFF2C3E50),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      height: 40,
                                      width: 40,
                                      "assets/images/img_googletrans.png",
                                      scale: 2,
                                    ),
                                    const SizedBox(width: 20),
                                    const Text("Sign in with Google"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Not a member?',
                              style: TextStyle(
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              onPressed: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () => Get.to(const PatientSignUp()));
                              },
                              child: const Text(
                                "Register Now",
                                style: TextStyle(
                                  color: Colors.blue,
                                  // color: Color(0xFF2C3E50),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Are you a Doctor?',
                              style: TextStyle(
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              onPressed: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () => Get.to(const DoctorSignIn()));
                              },
                              child: const Text(
                                "Join here",
                                style: TextStyle(
                                  color: Colors.blue,
                                  // color: Color(0xFF2C3E50),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
