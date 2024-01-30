class SizeVO {
  int? id;
  String? sizeName;
  String? createdAt;
  String? updatedAt;
  bool? isSelected;

  SizeVO({
    this.id,
    this.sizeName,
    this.createdAt,
    this.updatedAt,
    this.isSelected = false,
  });

  SizeVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sizeName = json['size_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size_name'] = this.sizeName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
