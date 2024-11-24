class Patient {
  String patientid;
  String emailid;
  String name;
  String dateofbirth;
  String gender;
  String location;

  Patient({
    required this.patientid,
    required this.emailid,
    required this.name,
    required this.dateofbirth,
    required this.gender,
    required this.location,
  });

  // Step 2: Implement fromJson and toJson methods

  // Convert a JSON object into a Doctor object
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      patientid: json['patientId'],
      emailid: json['emailId'],
      name: json['name'],
      dateofbirth: json['dateOfBirth'],
      gender: json['gender'],
      location: json['location'],
    );
  }

  // Convert a Doctor object into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'patientid': patientid,
      'emailid': emailid,
      'name': name,
      'dateofbirth': dateofbirth,
      'gender': gender,
      'location': location,
    };
  }
}
