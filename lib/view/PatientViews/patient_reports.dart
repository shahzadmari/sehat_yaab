import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sehat_yaab/controller/videocall_controller.dart';

class PatientReports extends StatefulWidget {
  const PatientReports({super.key});

  @override
  State<PatientReports> createState() => _PatientReportsState();
}

class _PatientReportsState extends State<PatientReports> {
  final VideoCallController _videoCallController =
      Get.put(VideoCallController());
  final String patientId =
      "patient123"; // Replace with authenticated patient ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Patient Video Call")),
        body: Text("hello world"));
  }
}
