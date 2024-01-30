class ExpressVO {
  int? id;
  String? name;
  int? phone;
  String? email;
  String? address;
  String? createdAt;
  String? updatedAt;

  ExpressVO(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.createdAt,
      this.updatedAt});

  ExpressVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
