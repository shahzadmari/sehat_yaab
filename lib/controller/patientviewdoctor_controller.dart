import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sehat_yaab/model/appointment_request.dart';
import 'package:sehat_yaab/view/PatientViews/bottomnavigation.dart';

class PatientViewDoctorController extends GetxController {
  RxInt selectedAppointmentType = 0.obs; // 0 for Online, 1 for Physical
  RxInt selectedDay = 0.obs;

  RxString appointmentType = "".obs;
  RxString appointmentDate = "".obs;
  RxString appointmentDay = "".obs;
  late FirebaseAuth auth;
  final patientid = FirebaseAuth.instance.currentUser!.uid;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    auth = FirebaseAuth.instance;
  }

  Future<void> savePatientPostRequest(
      String doctorid,
      int timeslot,
      String appointmentdate,
      String appointmentstatus,
      String appointmentday,
      String appointmenttype) async {
    isLoading.value = true;
    final url = Uri.parse("http://10.0.2.2:8080/apis/bookAppointment");

    Map<String, String> headers = {"Content-Type": "application/json"};
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode(AppointmentRequest(
                patientId: auth.currentUser!.uid,
                doctorId: doctorid,
                timeSlotId: timeslot,
                appointmentDate: appointmentdate,
                appointmentStatus: appointmentstatus,
                appointmentDay: appointmentday,
                appointmentType: appointmenttype)
            .toJson()));

    if (response.statusCode == 201) {
      print(response.body);

      isLoading.value = false;
      Get.snackbar(
          "Appointment Booked Successfully", "check your appointment page");

      Get.offAll(const BottomNavigationScreen());
    } else {
      Get.snackbar("Exception",
          "Failed to post data. Status code: ${response.statusCode}");
    }
  }
}
