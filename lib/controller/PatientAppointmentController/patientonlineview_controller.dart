import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PatientOnlineViewController extends GetxController {
  RxInt selectedAppointmentType = 0.obs; // 0 for Online, 1 for Physical
  RxInt selectedDay = 0.obs;

  RxString appointmentType = "".obs;
  RxString appointmentDate = "".obs;
  RxString appointmentDay = "".obs;

  final patientid = FirebaseAuth.instance.currentUser!.uid;
}
