import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sehat_yaab/controller/PatientBottomnavControllers/patienthome_controller.dart';
import 'package:sehat_yaab/view/PatientViews/patient_viewdoctor.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({super.key});

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  @override
  Widget build(BuildContext context) {
    final patientHomeController = Get.put(PatientHomeController());

    return Obx(
      () => SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Book Appointments"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        patientHomeController.checkAndProceed("physical");
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.43,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/img_phy_app.png",
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("physical appointment")
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        patientHomeController.checkAndProceed("online");
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.43,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/img_online_app.png",
                                width: 60,
                                height: 60,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("online appointment")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    patientHomeController.checkAndProceed("records");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/img_rcrd_his.png",
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Check Records")
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Search Doctors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Filter By"),
                    DropdownButton(
                      // Initial Value
                      value: patientHomeController.dropDownValue1.value,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),

                      // Array list of items
                      items: patientHomeController.locationItems1
                          .map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        patientHomeController.dropDownValue1.value = newValue!;
                        patientHomeController.applyFilters(
                          patientHomeController.dropDownValue2.value,
                          patientHomeController.dropDownValue1.value,
                        );
                      },
                    ),
                    DropdownButton(
                      // Initial Value
                      value: patientHomeController.dropDownValue2.value,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),

                      // Array list of items
                      items: patientHomeController.LocationItem2.map(
                          (String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        patientHomeController.dropDownValue2.value = newValue!;
                        patientHomeController.applyFilters(
                          patientHomeController.dropDownValue2.value,
                          patientHomeController.dropDownValue1.value,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                patientHomeController.isLoading.value
                    ? const Center(
                        child:
                            CircularProgressIndicator()) // Show loading indicator
                    : patientHomeController.doctorsList.isEmpty
                        ? const Center(
                            child: Text('No doctors available')) // If no data
                        : ListView.builder(
                            itemCount:
                                patientHomeController.filteredDoctors.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var doctor =
                                  patientHomeController.filteredDoctors[index];
                              return Card(
                                color: Colors.grey[300],
                                child: ListTile(
                                  onTap: () => Get.to(PatientViewDoctor(
                                    doctor: doctor,
                                  )),
                                  leading: const Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                    size: 50,
                                  ),
                                  title: Text(doctor.doctorName ?? 'No Name'),
                                  subtitle: Text(doctor.specialization ??
                                      'No Specialization'),
                                  trailing: Column(
                                    children: [
                                      Text(
                                          'Exp: ${doctor.experienceYears ?? '0'}'),
                                      const Icon(Icons.arrow_forward)
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
