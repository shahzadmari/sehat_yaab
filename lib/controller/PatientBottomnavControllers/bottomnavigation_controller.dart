import 'package:get/get.dart';

import 'package:sehat_yaab/view/PatientViews/bottomnavigation_home.dart';
import 'package:sehat_yaab/view/PatientViews/patient_appointments.dart';
import 'package:sehat_yaab/view/PatientViews/patient_chats.dart';
import 'package:sehat_yaab/view/PatientViews/patient_community.dart';
import 'package:sehat_yaab/view/PatientViews/patient_reports.dart';

class BottomNavigationController extends GetxController {
  RxInt index = 0.obs;

  final screens = [
    const BottomNavigationHome(),
    const PatientAppointments(),
    const PatientReports(),
    const PatientChats(),
    const PatientCommunity()
  ];
}
