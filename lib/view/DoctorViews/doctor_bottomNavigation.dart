import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sehat_yaab/controller/DoctorControllers/doctorbottomNavigation_controller.dart';
import 'package:sehat_yaab/controller/doctorsignin_controller.dart';
import 'package:sehat_yaab/view/AuthenticationViews/doctor_signIn.dart';

class DoctorBottomNavigationScreen extends StatefulWidget {
  const DoctorBottomNavigationScreen({super.key});

  @override
  State<DoctorBottomNavigationScreen> createState() =>
      _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<DoctorBottomNavigationScreen> {
  final doctorsignIncontroller = Get.put(DoctorSignInController());
  final navController = Get.put(DoctorNavigationController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.ads_click))
          ],
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.green),
                currentAccountPicture: const FlutterLogo(),
                accountName: Text(
                    doctorsignIncontroller.auth.currentUser!.displayName ??
                        "hello"),
                accountEmail: Text(
                    doctorsignIncontroller.auth.currentUser!.email ?? "hello")),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("my profile"),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text("recent patients"),
            ),
            const ListTile(
              leading: Icon(Icons.feedback),
              title: Text("reviews"),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("log out"),
              onTap: () => doctorsignIncontroller
                  .signOut()
                  .then((value) => Get.off(const DoctorSignIn())),
            )
          ],
        )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: navController.screens[navController.index.value],
        bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                // indicatorColor: Colors.blue.shade300,

                indicatorColor: Colors.green[200],
                labelTextStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 12, color: Colors.white))),
            child: NavigationBar(
                // backgroundColor: Colors.blue[900],
                backgroundColor: const Color.fromARGB(255, 22, 170, 44),
                selectedIndex: navController.index.value,
                onDestinationSelected: (newValue) {
                  navController.index.value = newValue;
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
                      label: "Reviews"),
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
                      label: "Appointment History")
                ])),
      ),
    );
  }
}
