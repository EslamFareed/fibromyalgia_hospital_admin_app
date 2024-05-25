class DiagnosticTestModel {
  String? image;
  String? price;
  String? discount;
  String? title;
  String? extraDesc;
  String? desc;

  DiagnosticTestModel(
      {this.image,
      this.price,
      this.discount,
      this.title,
      this.extraDesc,
      this.desc});

  DiagnosticTestModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
    title = json['title'];
    extraDesc = json['extraDesc'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['title'] = this.title;
    data['extraDesc'] = this.extraDesc;
    data['desc'] = this.desc;
    return data;
  }
}
