import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:sehat_yaab/controller/doctorsignin_controller.dart';
import 'package:sehat_yaab/controller/patientsignin_controller.dart';

import 'package:sehat_yaab/controller/usersession_controller.dart';
import 'package:sehat_yaab/firebase_options.dart';
import 'package:sehat_yaab/view/AuthenticationViews/doctor_signIn.dart';
import 'package:sehat_yaab/view/AuthenticationViews/patient_signin.dart';
import 'package:sehat_yaab/view/DoctorViews/doctor_bottomNavigation.dart';
import 'package:sehat_yaab/view/PatientViews/bottomnavigation.dart';
import 'package:sehat_yaab/view/PatientViews/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserSessionController());
    final intialcontroller = Get.put(PatientSignInController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Obx(() {
        if (userController.isLoggedIn.isFalse) {
          return const PatientSignIn();
        } else if (userController.isLoggedIn.isTrue) {
          if (userController.userType.value == "patient") {
            return const BottomNavigationScreen();
          } else if (userController.userType.value == "doctor") {
            return const DoctorBottomNavigationScreen();
          }
        }
        return const OnboardingScreen();
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(DoctorSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                controller
                    .signOut()
                    .then((value) => Get.off(const DoctorSignIn()));
              },
              child: const Text("sign out"))
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
