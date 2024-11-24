import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sehat_yaab/controller/PatientAppointmentController/patientAppointments.dart';

class CompletedAppointments extends StatelessWidget {
  const CompletedAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GetBuilder(
            init: PatientAppointmentsController(),
            builder: (controller) {
              return ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.appointments.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Text(
                            controller.appointments[index].Date +
                                " ," +
                                controller.appointments[index].time,
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.grey,
                            height: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.green,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.appointments[index].doctorName,
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text("cardiologist"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(CupertinoIcons.location_solid),
                                        Text("Online",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Text(
                                        "Booking id : ${controller.appointments[index].appointmentId}")
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey,
                            height: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.green),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    color: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("Re Book")),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 50,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Colors.green),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    "Review",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
