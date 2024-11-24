import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sehat_yaab/controller/PatientBottomnavControllers/bottomnavigation_controller.dart';
import 'package:sehat_yaab/controller/patientsignin_controller.dart';
import 'package:sehat_yaab/view/AuthenticationViews/patient_signin.dart';
import 'package:sehat_yaab/view/PatientViews/patient_viewdoctor.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationScreen> {
  final navcontroller = Get.put(BottomNavigationController());
  final signIncontroller = Get.find<PatientSignInController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(const PatientViewDoctor());
                },
                icon: const Icon(Icons.ads_click))
          ],
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.green),
                currentAccountPicture: const FlutterLogo(),
                accountName: Text(
                    signIncontroller.auth.currentUser!.displayName.toString()),
                accountEmail:
                    Text(signIncontroller.auth.currentUser!.email.toString())),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("my profile"),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text("recent doctors"),
            ),
            const ListTile(
              leading: Icon(Icons.feedback),
              title: Text("feedback"),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("log out"),
              onTap: () => signIncontroller
                  .signOut()
                  .then((value) => Get.off(const PatientSignIn())),
            )
          ],
        )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: navcontroller.screens[navcontroller.index.value],
        bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                // indicatorColor: Colors.blue.shade300,

                indicatorColor: Colors.green[200],
                labelTextStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 12, color: Colors.white))),
            child: NavigationBar(
                // backgroundColor: Colors.blue[900],
                backgroundColor: const Color.fromARGB(255, 22, 170, 44),
                selectedIndex: navcontroller.index.value,
                onDestinationSelected: (selectValue) {
                  navcontroller.index.value = selectValue;
                },
                destinations: const [
                  NavigationDestination(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: "Home"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.schedule,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: "Appointments"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.report,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: "Reports"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.chat,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: "Chats"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.article,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: "Community")
                ])),
      ),
    );
  }
}
