class DiagnosticTestRequestModel {
  String? patientName;
  String? gender;
  String? phone;
  String? diagnosticTestPrice;
  String? diagnosticTest;
  String? userId;
  String? email;
  String? age;

  DiagnosticTestRequestModel(
      {this.patientName,
      this.gender,
      this.phone,
      this.diagnosticTestPrice,
      this.diagnosticTest,
      this.userId,
      this.email,
      this.age});

  DiagnosticTestRequestModel.fromJson(Map<String, dynamic> json) {
    patientName = json['patientName'];
    gender = json['gender'];
    phone = json['phone'];
    diagnosticTestPrice = json['diagnosticTestPrice'];
    diagnosticTest = json['diagnosticTest'];
    userId = json['userId'];
    email = json['email'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientName'] = this.patientName;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['diagnosticTestPrice'] = this.diagnosticTestPrice;
    data['diagnosticTest'] = this.diagnosticTest;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['age'] = this.age;
    return data;
  }
}
