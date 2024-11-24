import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sehat_yaab/controller/Onboarding/onboarding_controller.dart';
import 'package:sehat_yaab/view/AuthenticationViews/patient_signin.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final onboardController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        children: [
          PageView.builder(
              itemCount: onboardController.data.length,
              onPageChanged: (index) {
                onboardController.currentIndex.value = index;
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      onboardController.data[index].name,
                      width: 300,
                      height: 350,
                    ),
                    Text(
                      onboardController.data[index].title,
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(onboardController.data[index].description),
                  ],
                );
              }),
          Obx(
            () => Align(
              alignment: Alignment.bottomCenter,
              child: (onboardController.currentIndex.value ==
                      onboardController.data.length - 1)
                  ? ElevatedButton(
                      onPressed: () {},
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(const PatientSignIn());
                          },
                          child: const Text("continue")))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(onboardController.data.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 5,
                          width: onboardController.currentIndex.value == index
                              ? 15
                              : 5, // Adjust the size of the active dot
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: onboardController.currentIndex.value == index
                                ? Colors.black
                                : Colors
                                    .grey, // Adjust active and inactive dot colors
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      }),
                    ),
            ),
          ),
        ],
      ),
    ));
  }
}
