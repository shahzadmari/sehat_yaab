import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sehat_yaab/controller/PatientAppointmentController/patientonlineappointment_controller.dart';
import 'package:sehat_yaab/controller/PatientBottomnavControllers/patienthome_controller.dart';
import 'package:sehat_yaab/view/PatientViews/patient_viewdoctor.dart';
import 'package:sehat_yaab/view/PatientViews/patient_viewdoctoronline.dart';

class PatientOnlineAppointments extends StatelessWidget {
  const PatientOnlineAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientOnlineAppointmentsController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("Online Appointments"),
        ),
        body: Column(
          children: [
            controller.patientHomeController.isLoading.value
                ? const Center(
                    child:
                        CircularProgressIndicator()) // Show loading indicator
                : controller.patientHomeController.doctorsList.isEmpty
                    ? const Center(
                        child: Text('No doctors available')) // If no data
                    : ListView.builder(
                        itemCount:
                            controller.patientHomeController.doctorsList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var doctor = controller
                              .patientHomeController.doctorsList[index];
                          return Card(
                            color: Colors.grey[300],
                            child: ListTile(
                              onTap: () => Get.to(PatientOnlineView(
                                doctor: doctor,
                              )),
                              leading: const Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 50,
                              ),
                              title: Text(doctor.doctorName ?? 'No Name'),
                              subtitle: Text(
                                  doctor.specialization ?? 'No Specialization'),
                              trailing: Column(
                                children: [
                                  Text('Exp: ${doctor.experienceYears ?? '0'}'),
                                  const Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }
}
