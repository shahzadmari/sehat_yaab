import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sehat_yaab/controller/patientsignup_controller.dart';

import 'dart:math' as maths;

class PatientSignUp extends StatelessWidget {
  const PatientSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientSignUpController());
    final formKey = GlobalKey<FormState>();
    return Obx(() => Container(
          //  decoration: BoxDecoration(gradient: gradeGrey),
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,

              backgroundColor: Colors.white,
              // backgroundColor: const Color(0xFF2C5364),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                  // color: Color(0xFF203A43),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 10.0),
                                child: Text(
                                  "Become a part of Sehat Yaab",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    // color: Color(0xFF203A43),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: controller.nameController,
                                  cursorColor:
                                      const Color.fromARGB(255, 240, 241, 243),
                                  cursorWidth: 1.0,
                                  decoration: const InputDecoration(
                                    labelText: "Name",
                                    hintText: "e.g Mark ZingerBurger",
                                    border: InputBorder.none,
                                  ),
                                  onSaved: (newValue) {
                                    controller.name = newValue!;
                                  },
                                  validator: (value) {
                                    return controller.nameValidator(value);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                padding: const EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: controller.emailController,
                                  cursorColor: const Color(0xFF2C3E50),
                                  cursorWidth: 1.0,
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                    hintText: "yourEmail@email.com",
                                    border: InputBorder.none,
                                  ),
                                  onSaved: (newValue) {
                                    controller.email = newValue!;
                                  },
                                  validator: (value) {
                                    return controller.emailValidator(value);
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
                                  controller: controller.passwordController,
                                  obscureText:
                                      !controller.passwordVisible.value,
                                  cursorColor: const Color(0xFF2C3E50),
                                  cursorWidth: 1.0,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: const TextStyle(
                                        color: Color(0xFF8E9EAB)),
                                    hintText: "••••••••",
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                      splashRadius: 10,
                                      icon: Icon(
                                        controller.passwordVisible.isTrue
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xFF8E9EAB),
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        controller.passwordVisible.value =
                                            !controller.passwordVisible.value;
                                      },
                                    ),
                                  ),
                                  onSaved: (newValue) {
                                    controller.password = newValue!;
                                  },
                                  validator: (value) {
                                    return controller.passwordValidator(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity),
                                child: CupertinoButton(
                                  color: const Color(0xFF2C3E50),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      controller.SignUp();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: controller.isLoading.value
                                        ? const CircularProgressIndicator()
                                        : const Text("Sign Up"),
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
                                        angle: maths.pi,
                                        child: Container(
                                          height: 1,
                                          decoration: const BoxDecoration(
                                            //   gradient: gradeGrey,
                                            color: Colors.white,
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
                                    children: [
                                      Image.asset(
                                        width: 40,
                                        height: 40,
                                        "assets/images/img_googletrans.png",
                                        scale: 2,
                                      ),
                                      const SizedBox(width: 20),
                                      const Text("Google SignIn"),
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
                                'Already a member?',
                                style: TextStyle(
                                  color: Color(0xFF2C3E50),
                                ),
                              ),
                              CupertinoButton(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                onPressed: () async {
                                  Get.back();
                                },
                                child: const Text(
                                  "SignIn here",
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
          ),
        ));
  }
}
