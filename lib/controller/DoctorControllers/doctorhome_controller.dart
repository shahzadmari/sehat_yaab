import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sehat_yaab/model/doctor.dart';
import 'package:sehat_yaab/utils/doctordata.dart';

class DoctorHomeController extends GetxController {
  RxInt selectedAppointmentType = 0.obs; // 0 for Online, 1 for Physical
  RxInt selectedDay = 0.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String baseUrl = 'http://10.0.2.2:8080/apis/getOneDoctor';

  // Define doctor as an Rxn<Doctors>

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    final url = Uri.parse('$baseUrl/${auth.currentUser!.uid}');

    try {
      final response = await http.post(url);

      if (response.statusCode == 200) {
        // Parse the JSON response into the Doctor model
        final Map<String, dynamic> data = json.decode(response.body);
        Doctordata.doctor.value = Doctors.fromJson(data); // Set value correctly
        print(
            "doctor fetched successfully: ${Doctordata.doctor.value!.doctorId}");
      } else {
        throw Exception(
            'Failed to load doctor details. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching doctor details: $error');
    }
  }
}
