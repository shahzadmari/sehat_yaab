class AppointmentRequest {
  String? patientId;
  String? doctorId;
  int? timeSlotId;
  String? appointmentDate;
  String? appointmentStatus;
  String? appointmentDay;
  String? appointmentType;

  AppointmentRequest(
      {this.patientId,
      this.doctorId,
      this.timeSlotId,
      this.appointmentDate,
      this.appointmentStatus,
      this.appointmentDay,
      this.appointmentType});

  AppointmentRequest.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    timeSlotId = json['timeSlotId'];
    appointmentDate = json['appointmentDate'];
    appointmentStatus = json['appointmentStatus'];
    appointmentDay = json['appointmentDay'];
    appointmentType = json['appointmentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientId'] = this.patientId;
    data['doctorId'] = this.doctorId;
    data['timeSlotId'] = this.timeSlotId;
    data['appointmentDate'] = this.appointmentDate;
    data['appointmentStatus'] = this.appointmentStatus;
    data['appointmentDay'] = this.appointmentDay;
    data['appointmentType'] = this.appointmentType;
    return data;
  }
}
