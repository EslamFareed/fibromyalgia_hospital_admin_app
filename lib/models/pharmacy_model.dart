class PharmacyModel {
  String? image;
  String? address;
  String? rate;
  String? phone;
  String? name;
  String? discount;
  String? viewCount;

  PharmacyModel(
      {this.image,
      this.address,
      this.rate,
      this.phone,
      this.name,
      this.discount,
      this.viewCount});

  PharmacyModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    address = json['address'];
    rate = json['rate'];
    phone = json['phone'];
    name = json['name'];
    discount = json['discount'];
    viewCount = json['viewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['address'] = this.address;
    data['rate'] = this.rate;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['discount'] = this.discount;
    data['viewCount'] = this.viewCount;
    return data;
  }
}
