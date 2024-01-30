class CountingUnitVO {
  int? id;
  String? unitCode;
  String? unitName;
  int? currentQuantity;
  int? sellingPrice;
  int? purchasePrice;
  int? itemId;
  String? itemName;
  String? itemCode;
  String? photoPath;
  String? photoRight;
  String? photoLeft;
  String? photoBody;
  String? photoBack;
  int? hotDeals;
  int? categoryId;
  String? categoryName;
  int? subcategoryId;
  String? subcategoryName;
  int? sizeId;
  String? sizeName;

  CountingUnitVO(
      {this.id,
      this.unitCode,
      this.unitName,
      this.currentQuantity,
      this.sellingPrice,
      this.purchasePrice,
      this.itemId,
      this.itemName,
      this.itemCode,
      this.photoPath,
      this.photoRight,
      this.photoLeft,
      this.photoBody,
      this.photoBack,
      this.hotDeals,
      this.categoryId,
      this.categoryName,
      this.subcategoryId,
      this.subcategoryName,
      this.sizeId,
      this.sizeName});

  CountingUnitVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitCode = json['unit_code'];
    unitName = json['unit_name'];
    currentQuantity = json['current_quantity'];
    sellingPrice = json['selling_price'];
    purchasePrice = json['purchase_price'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemCode = json['item_code'];
    photoPath = json['photo_path'];
    photoRight = json['photo_right'];
    photoLeft = json['photo_left'];
    photoBody = json['photo_body'];
    photoBack = json['photo_back'];
    hotDeals = json['hot_deals'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    sizeId = json['size_id'];
    sizeName = json['size_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unit_code'] = this.unitCode;
    data['unit_name'] = this.unitName;
    data['current_quantity'] = this.currentQuantity;
    data['selling_price'] = this.sellingPrice;
    data['purchase_price'] = this.purchasePrice;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_code'] = this.itemCode;
    data['photo_path'] = this.photoPath;
    data['photo_right'] = this.photoRight;
    data['photo_left'] = this.photoLeft;
    data['photo_body'] = this.photoBody;
    data['photo_back'] = this.photoBack;
    data['hot_deals'] = this.hotDeals;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['subcategory_id'] = this.subcategoryId;
    data['subcategory_name'] = this.subcategoryName;
    data['size_id'] = this.sizeId;
    data['size_name'] = this.sizeName;
    return data;
  }
}
