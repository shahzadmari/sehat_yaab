import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:sehat_yaab/view/DoctorViews/doctor_homepage.dart';
import 'package:sehat_yaab/view/DoctorViews/doctorreviews.dart';

class DoctorNavigationController extends GetxController {
  RxInt index = 0.obs;

  final screens = [
    DoctorHomeScreen(),
    const Center(
      child: Text("Doctor's appointents"),
    ),
    Doctorreviews(),
    const Center(
      child: Text("chat here"),
    ),
    const Center(
      child: Text("History"),
    )
  ];
}
