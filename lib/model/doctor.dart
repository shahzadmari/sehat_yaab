class Doctor {
  int doctorid;
  String name, location, specialization;
  Doctor(
      {required this.doctorid,
      required this.name,
      required this.location,
      required this.specialization});
}

class Doctors {
  String? doctorId;
  String? doctorName;
  String? specialization;
  String? email;
  String? experienceYears;
  String? gender;
  String? location;
  String? hospitalAddress;
  List<AvailibilitySchedule>? availibilitySchedule;
  List<Reviews>? reviews;
  double? averageRating;
  String? createdAt;
  String? updatedAt;

  Doctors(
      {this.doctorId,
      this.doctorName,
      this.specialization,
      this.email,
      this.experienceYears,
      this.gender,
      this.location,
      this.hospitalAddress,
      this.availibilitySchedule,
      this.reviews,
      this.averageRating,
      this.createdAt,
      this.updatedAt});

  Doctors.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    specialization = json['specialization'];
    email = json['email'];
    experienceYears = json['experience_years'];
    gender = json['gender'];
    location = json['location'];
    hospitalAddress = json['hospital_address'];
    if (json['availibilitySchedule'] != null) {
      availibilitySchedule = <AvailibilitySchedule>[];
      json['availibilitySchedule'].forEach((v) {
        availibilitySchedule!.add(new AvailibilitySchedule.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    averageRating = json['averageRating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['specialization'] = this.specialization;
    data['email'] = this.email;
    data['experience_years'] = this.experienceYears;
    data['gender'] = this.gender;
    data['location'] = this.location;
    data['hospital_address'] = this.hospitalAddress;
    if (this.availibilitySchedule != null) {
      data['availibilitySchedule'] =
          this.availibilitySchedule!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['averageRating'] = this.averageRating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AvailibilitySchedule {
  int? availabilityId;
  String? date;
  String? day;

  String? appointmentType;
  List<TimeSlots>? timeSlots;

  AvailibilitySchedule(
      {this.availabilityId,
      this.date,
      this.day,
      this.appointmentType,
      this.timeSlots});

  AvailibilitySchedule.fromJson(Map<String, dynamic> json) {
    availabilityId = json['availability_id'];
    date = json['date'];
    day = json['day'];
    appointmentType = json['appointmentType'];
    if (json['timeSlots'] != null) {
      timeSlots = <TimeSlots>[];
      json['timeSlots'].forEach((v) {
        timeSlots!.add(new TimeSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availability_id'] = this.availabilityId;
    data['date'] = this.date;
    data['day'] = this.day;
    data['appointmentType'] = this.appointmentType;
    if (this.timeSlots != null) {
      data['timeSlots'] = this.timeSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeSlots {
  int? slotId;
  int? tokenNo;
  Null appointment;
  bool? booked;

  TimeSlots({this.slotId, this.tokenNo, this.appointment, this.booked});

  TimeSlots.fromJson(Map<String, dynamic> json) {
    slotId = json['slot_id'];
    tokenNo = json['token_no'];
    appointment = json['appointment'];
    booked = json['booked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot_id'] = this.slotId;
    data['token_no'] = this.tokenNo;
    data['appointment'] = this.appointment;
    data['booked'] = this.booked;
    return data;
  }
}

class Reviews {
  int? reviewId;
  int? rating;
  String? comment;
  String? patientName;
  String? patienEmail;
  String? createdAt;

  Reviews(
      {this.reviewId,
      this.rating,
      this.comment,
      this.patientName,
      this.patienEmail,
      this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    reviewId = json['reviewId'];
    rating = json['rating'];
    comment = json['comment'];
    patientName = json['patientName'];
    patienEmail = json['patienEmail'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewId'] = this.reviewId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['patientName'] = this.patientName;
    data['patienEmail'] = this.patienEmail;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
