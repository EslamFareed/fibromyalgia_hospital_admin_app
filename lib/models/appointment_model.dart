class AppointmentModel {
  String? doctorName;
  String? doctorId;
  String? forWho;
  String? time;
  String? type;
  String? patinetName;
  String? userId;
  String? day;
  String? patientPhone;
  String? paymentType;
  String? status;

  AppointmentModel(
      {this.doctorName,
      this.doctorId,
      this.forWho,
      this.time,
      this.type,
      this.patinetName,
      this.userId,
      this.day,
      this.patientPhone,
      this.paymentType,
      this.status});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctorName'];
    doctorId = json['doctorId'];
    forWho = json['forWho'];
    time = json['time'];
    type = json['type'];
    patinetName = json['patinetName'];
    userId = json['userId'];
    day = json['day'];
    patientPhone = json['patientPhone'];
    paymentType = json['paymentType'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctorName'] = this.doctorName;
    data['doctorId'] = this.doctorId;
    data['forWho'] = this.forWho;
    data['time'] = this.time;
    data['type'] = this.type;
    data['patinetName'] = this.patinetName;
    data['userId'] = this.userId;
    data['day'] = this.day;
    data['patientPhone'] = this.patientPhone;
    data['paymentType'] = this.paymentType;
    data['status'] = this.status;
    return data;
  }
}
