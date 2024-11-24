import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sehat_yaab/controller/PatientAppointmentController/patientphysicalview_controller.dart';

class PatientPhysicalView extends StatelessWidget {
  final doctor;
  const PatientPhysicalView({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientPhysicalViewController());

    List getPhysicalAppointments() {
      return doctor.availibilitySchedule
          .where((schedule) => schedule.appointmentType == 'physical')
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.amber),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Text(
                            "4.5",
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
                "Book a Physical Appointment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Day Buttons (Filtered for physical appointments)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      List.generate(getPhysicalAppointments().length, (index) {
                    final availableDays = getPhysicalAppointments();

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
                        availableDays[index].day ?? '',
                      ),
                    );
                  }),
                ),
              ),

              // Display Time Slots for the selected day
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount:
                      getPhysicalAppointments()[controller.selectedDay.value]
                          .timeSlots
                          .length,
                  itemBuilder: (context, index) {
                    final availableTimeslots =
                        getPhysicalAppointments()[controller.selectedDay.value]
                            .timeSlots;

                    final times = availableTimeslots[index];
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("  Slot " + times.tokenNo.toString()),
                          ElevatedButton(
                              onPressed: () => print(controller.patientid +
                                  ", " +
                                  doctor.reviews.toString() +
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
