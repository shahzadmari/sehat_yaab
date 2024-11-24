import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sehat_yaab/model/doctor.dart';
import 'package:sehat_yaab/view/PatientViews/patient_onlineappointments.dart';
import 'package:sehat_yaab/view/PatientViews/patient_physicalappointments.dart';
import 'package:sehat_yaab/view/PatientViews/patient_updateprofile.dart';
import 'package:http/http.dart' as http;

class PatientHomeController extends GetxController {
  RxBool isUpdated = false.obs;

  final GetStorage storage = GetStorage();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var doctorsList = <Doctors>[].obs; // Observable list of doctors
  var filteredDoctors = <Doctors>[].obs;
  var isLoading = true.obs;
  final String baseUrl = 'http://10.0.2.2:8080/apis/getAllDoctor';
  RxString dropDownValue1 = "location".obs;
  RxString dropDownValue2 = "specialization".obs;

  final locationItems1 = [
    "location",
    "current location",
    "karachi",
    "islamabad",
    "lahore",
    "hyderabad",
    "faisalabad"
  ];
  final LocationItem2 = [
    "specialization",
    "uerologist",
    "cardiologist",
    "neurologist",
    "dentist"
  ];

  @override
  void onInit() {
    super.onInit();

    isUpdated.value =
        storage.read('isUpdated_${auth.currentUser!.uid}') ?? false;

    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        // Decode JSON response
        var jsonData = jsonDecode(response.body);

        // Parse list of doctors
        doctorsList.clear();
        for (var doctor in jsonData) {
          doctorsList.add(Doctors.fromJson(doctor));
        }
        filteredDoctors.assignAll(doctorsList);
        print("Doctors data fetched successfully");
      } else {
        print("Failed to fetch doctors. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error while fetching doctors: $e");
    } finally {
      isLoading(false); // Turn off loading indicator
    }
  }

  void applyFilters(String? specialization, String? location) {
    print(
        'Applying filters: Specialization = $specialization, Location = $location');
    filteredDoctors.assignAll(doctorsList.where((doctor) {
      bool matchesSpecialization = specialization == null ||
          specialization == "specialization" ||
          doctor.specialization!
              .toLowerCase()
              .contains(specialization.toLowerCase());
      bool matchesLocation = location == null ||
          location == "location" ||
          doctor.location!.toLowerCase().contains(location.toLowerCase());
      return matchesSpecialization && matchesLocation;
    }).toList());
    print('Filtered Doctors: ${filteredDoctors.length}');
  }

  void checkAndProceed(String value) {
    //idUpdated is showing someissues with updated it's state after updated profile still shows dialog box of update profile had to be solved other wise direct storage.read() works fine
    if (storage.read('isUpdated_${auth.currentUser!.uid}')) {
      if (value == "online") {
        Get.to(PatientOnlineAppointments());
      }

      if (value == "physical") {
        Get.to(const PatientPhysicalAppointments());
      }

      if (value == "records") {}
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text(
              'Update profile'), // To display the title it is optional
          content: const Text(
              'please update your profile data first'), // Message which will be pop up on the screen
          // Action widget which will provide the user to acknowledge the choice
          actions: [
            TextButton(
                onPressed: () => Get.to(const PatientUpdateProfile()),
                child: const Text("Update Profile")),
            TextButton(
                onPressed: () => Get.back(), child: const Text("Cancel")),
          ],
        ),
      );
    }
  }
}
