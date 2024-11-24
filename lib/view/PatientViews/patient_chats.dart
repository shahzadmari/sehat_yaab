import 'package:flutter/material.dart';

class PatientChats extends StatefulWidget {
  const PatientChats({super.key});

  @override
  State<PatientChats> createState() => _PatientReportsState();
}

class _PatientReportsState extends State<PatientChats> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("Chats")],
      ),
    );
  }
}
