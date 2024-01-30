class ColorVO {
  int? id;
  String? subcategoryName;
  String? photo;
  String? createdAt;
  int? categoryId;
  String? categoryName;
  String? colorCode;
  bool? isSelected;

  ColorVO({
    this.id,
    this.subcategoryName,
    this.photo,
    this.createdAt,
    this.categoryId,
    this.categoryName,
    this.colorCode,
    this.isSelected,
  });

  ColorVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcategoryName = json['subcategory_name'];
    photo = json['photo'];
    createdAt = json['created_at'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    colorCode = json['colour_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subcategory_name'] = this.subcategoryName;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['colour_code'] = this.colorCode;
    return data;
  }
}
