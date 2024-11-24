import 'package:flutter/material.dart';
import 'package:sehat_yaab/view/PatientViews/Widgets/patientcomplete_appointments.dart';
import 'package:sehat_yaab/view/PatientViews/Widgets/patientscheduled_appointments.dart';

class PatientAppointments extends StatefulWidget {
  const PatientAppointments({super.key});

  @override
  State<PatientAppointments> createState() => _PatientAppointmentsState();
}

class _PatientAppointmentsState extends State<PatientAppointments> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              text: "Completed",
            ),
            Tab(
              text: "Waiting",
            )
          ]),
        ),
        body: const TabBarView(children: [
          CompletedAppointments(),
          PatientScheduledAppointments()
        ]),
      ),
    );
  }
}
