import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sehat_yaab/controller/patientviewdoctor_controller.dart';
import 'package:sehat_yaab/view/PatientViews/patient_reviews.dart';

class PatientViewDoctor extends StatelessWidget {
  final doctor;
  const PatientViewDoctor({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientViewDoctorController());

    // Helper function to filter availableschedule list based on appointment type
    List getAvailableDays(String appointmentType) {
      return doctor.availibilitySchedule
          .where((schedule) => schedule.appointmentType == appointmentType)
          .toList();
    }

    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 60,
              ),
              const SizedBox(height: 10),
              Text(
                doctor.doctorName ?? "null",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              Text(
                doctor.specialization ?? "null",
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(PatientReviews(reviews: doctor.reviews));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.amber),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Text(
                              "${doctor.averageRating}",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "40+ Patients",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Book a date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ToggleButtons(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  isSelected: [
                    controller.selectedAppointmentType.value ==
                        0, //when online appointments button is selected 0 will be assigned to this variable
                    controller.selectedAppointmentType.value ==
                        1 //when physical appointments button is selected 1 will be assigned to this variable
                  ],
                  onPressed: (int index) {
                    controller.selectedAppointmentType.value =
                        index; //assigning index of the appointment type button to the variable
                    controller.selectedDay.value =
                        0; // Reset day selection before selecting any day
                  },
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Online Appointment'), //button 0
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Physical Appointment'), //button 1
                    ),
                  ],
                ),
              ),

              // Day Buttons (Filtered based on appointment type)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      getAvailableDays(
                              controller.selectedAppointmentType.value == 0
                                  ? 'online'
                                  : 'physical')
                          .length, (index) {
                    final availableDays = getAvailableDays(controller
                                .selectedAppointmentType.value ==
                            0
                        ? 'online'
                        : 'physical'); //getavailableday() returns availabilityschedule list based on string argument of appointmentType

                    return ElevatedButton(
                      onPressed: () {
                        controller.selectedDay.value =
                            index; // assigning index of selected day button to variable

                        controller.appointmentDay.value =
                            availableDays[index].day;
                        controller.appointmentDate.value =
                            availableDays[index].date;
                        controller.appointmentType.value =
                            availableDays[index].appointmentType;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.selectedDay.value == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      child: Text(
                        availableDays[index].day,
                      ),
                    );
                  }),
                ),
              ),

              // Display Time Slots for the selected day and appointment type
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.selectedAppointmentType.value == 0
                      ? getAvailableDays('online')[controller.selectedDay.value]
                          .timeSlots
                          .length
                      : getAvailableDays(
                              'physical')[controller.selectedDay.value]
                          .timeSlots
                          .length,
                  itemBuilder: (context, index) {
                    final availableTimeslots =
                        controller.selectedAppointmentType.value == 0
                            ? getAvailableDays(
                                    'online')[controller.selectedDay.value]
                                .timeSlots
                            : getAvailableDays(
                                    'physical')[controller.selectedDay.value]
                                .timeSlots;

                    final times = availableTimeslots[index];
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("  to " + times.tokenNo.toString()),
                          ElevatedButton(
                              onPressed: () => print(controller.patientid +
                                  ", " +
                                  doctor.reviews.toString() +
                                  times.tokenNo.toString() +
                                  ", " +
                                  times.slotId.toString() +
                                  ", " +
                                  controller.appointmentDate.value +
                                  ", " +
                                  controller.appointmentDay.value +
                                  ", " +
                                  controller.appointmentType.value),
                              child: const Text("Book"))
                        ],
                      ),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
