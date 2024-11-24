import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sehat_yaab/controller/PatientAppointmentController/patientupdateprofile_controller.dart';

class PatientUpdateProfile extends StatelessWidget {
  const PatientUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientUpdateProfileController());

    return Obx(
      () => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Update Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                      hintText: "Enter email",
                      labelText: "Email",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.namecontroller,
                  decoration: const InputDecoration(
                      hintText: "name",
                      labelText: "Name",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    //editing controller of this TextField
                    controller: controller.dateController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
                        ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      await controller.pickDate(context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 380,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: DropdownButton(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          isExpanded: true,
                          hint: const Text("Selected Gender"),
                          value: controller.SelectedGender.value,
                          items: controller.genders.map((String Value) {
                            return DropdownMenuItem(
                                value: Value, child: Text(Value));
                          }).toList(),
                          onChanged: (newValue) {
                            controller.SelectedGender.value = newValue!;
                          }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 380,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: DropdownButton(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          isExpanded: true,
                          hint: const Text("Location"),
                          value: controller.SelectedLocation.value,
                          items: controller.locations.map((String Value) {
                            return DropdownMenuItem(
                                value: Value, child: Text(Value));
                          }).toList(),
                          onChanged: (newValue) {
                            controller.SelectedLocation.value = newValue!;
                          }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async => await controller.savePatientPostRequest(),
                  child: Container(
                    width: 150,
                    height: 60,
                    child: Center(
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : const Text(
                                "update profile",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
