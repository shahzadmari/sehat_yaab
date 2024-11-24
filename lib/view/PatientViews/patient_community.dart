import 'package:flutter/material.dart';

class PatientCommunity extends StatefulWidget {
  const PatientCommunity({super.key});

  @override
  State<PatientCommunity> createState() => _PatientCommunityState();
}

class _PatientCommunityState extends State<PatientCommunity> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("community")],
      ),
    );
  }
}
