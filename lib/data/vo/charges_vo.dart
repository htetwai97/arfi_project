class ChargesVO {
  int? id;
  String? township;
  int? districtId;
  int? deliveryexpressId;
  String? deliveryexpressName;
  int? charges;
  String? createdAt;
  String? updatedAt;

  ChargesVO(
      {this.id,
      this.township,
      this.districtId,
      this.deliveryexpressId,
      this.deliveryexpressName,
      this.charges,
      this.createdAt,
      this.updatedAt});

  ChargesVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    township = json['township'];
    districtId = json['district_id'];
    deliveryexpressId = json['deliveryexpress_id'];
    deliveryexpressName = json['deliveryexpress_name'];
    charges = json['charges'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['township'] = this.township;
    data['district_id'] = this.districtId;
    data['deliveryexpress_id'] = this.deliveryexpressId;
    data['deliveryexpress_name'] = this.deliveryexpressName;
    data['charges'] = this.charges;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
