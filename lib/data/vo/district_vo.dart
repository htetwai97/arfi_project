class DistrictVO {
  int? id;
  String? districtName;
  String? createdAt;
  String? updatedAt;

  DistrictVO({this.id, this.districtName, this.createdAt, this.updatedAt});

  DistrictVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtName = json['district_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_name'] = this.districtName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
