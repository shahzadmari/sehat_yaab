import 'package:get/get.dart';
import 'package:sehat_yaab/model/appointment.dart';

class PatientAppointmentsController extends GetxController {
  List<Appointment> appointments = [
    Appointment(
        appointmentId: 1,
        doctorName: "Dr shams",
        address: "Karachi",
        time: "9am",
        Date: "nov 18",
        status: "scheduled"),
    Appointment(
        appointmentId: 2,
        doctorName: "Dr Nafees",
        address: "Karachi",
        time: "9am",
        Date: "nov 21",
        status: "scheduled"),
    Appointment(
        appointmentId: 3,
        doctorName: "Dr Saifuddin",
        address: "Karachi",
        time: "9am to 10am",
        Date: "nov22",
        status: "scheduled"),
    Appointment(
        appointmentId: 4,
        doctorName: "Dr shams",
        address: "Karachi",
        time: "9am to 10am",
        Date: "nov 23",
        status: "scheduled")
  ];
}
