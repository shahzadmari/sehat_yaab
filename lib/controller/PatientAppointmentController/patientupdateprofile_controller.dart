import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sehat_yaab/model/patient.dart';
import 'package:http/http.dart' as http;
import 'package:sehat_yaab/view/PatientViews/bottomnavigation.dart';

class PatientUpdateProfileController extends GetxController {
  List<String> genders = ["gender", "male", "female", "other"];

  List<String> locations = [
    "location",
    "Karachi",
    "hyderabad",
    "sukkur",
    "larkana",
    "nawabshah",
    "nausharo feroze",
    "ghotki",
    "thar"
  ];
  RxString SelectedGender = "gender".obs, SelectedLocation = "location".obs;
  String? formateddate;
  late TextEditingController dateController;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late FirebaseAuth auth;
  final GetStorage storage = GetStorage();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    dateController = TextEditingController();
    auth = FirebaseAuth.instance;
    emailController.text = auth.currentUser!.email!;
    namecontroller.text = auth.currentUser!.displayName!;
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickdate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime.now());

    if (pickdate != null) {
      formateddate = DateFormat('yyyy-MM-dd').format(pickdate);
      dateController.text = formateddate!;
    }
  }

  Future<void> savePatientPostRequest() async {
    isLoading.value = true;
    final url = Uri.parse("http://10.0.2.2:8080/apis/patient");
    Patient patient = Patient(
        patientid: auth.currentUser!.uid,
        emailid: emailController.text,
        name: namecontroller.text,
        dateofbirth: formateddate!,
        gender: SelectedGender.value,
        location: SelectedLocation.value);
    Map<String, String> headers = {"Content-Type": "application/json"};
    final response = await http.post(url,
        headers: headers, body: jsonEncode(patient.toJson()));

    if (response.statusCode == 201) {
      print(response.body);
      storage.write('isUpdated_${auth.currentUser!.uid}', true);
      isLoading.value = false;
      Get.snackbar("profile update", "data is uploaded successfully");

      Get.offAll(const BottomNavigationScreen());
    } else {
      Get.snackbar("Exception",
          "Failed to post data. Status code: ${response.statusCode}");
    }
  }

  void showData() {
    print(auth.currentUser!.uid);
    print(namecontroller.text);
    print(emailController.text);
    print(formateddate);
    print(SelectedGender);
    print(SelectedLocation);
  }
}
