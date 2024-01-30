class ItemVO {
  int? id;
  String? itemCode;
  String? itemName;
  String? categoryName;
  int? categoryId;
  String? subcategoryName;
  int? subcategoryId;
  String? photoPath;

  ItemVO(
      {this.id,
      this.itemCode,
      this.itemName,
      this.categoryName,
      this.categoryId,
      this.subcategoryName,
      this.subcategoryId,
      this.photoPath});

  ItemVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemCode = json['item_code'];
    itemName = json['item_name'];
    categoryName = json['category_name'];
    categoryId = json['category_id'];
    subcategoryName = json['subcategory_name'];
    subcategoryId = json['subcategory_id'];
    photoPath = json['photo_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_code'] = this.itemCode;
    data['item_name'] = this.itemName;
    data['category_name'] = this.categoryName;
    data['category_id'] = this.categoryId;
    data['subcategory_name'] = this.subcategoryName;
    data['subcategory_id'] = this.subcategoryId;
    data['photo_path'] = this.photoPath;
    return data;
  }
}
