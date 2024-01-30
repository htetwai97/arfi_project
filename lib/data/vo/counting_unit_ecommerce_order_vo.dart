class CountingUnitEcommerceOrdersVO {
  int? countingUnitId;
  String? unitName;
  int? quantity;
  int? price;
  int? sizeId;
  String? size;
  int? itemTotalPrice;
  int? itemId;
  String? itemName;
  String? itemCode;
  String? photo;
  int? categoryId;
  String? category;
  int? subcategoryId;
  String? subcategoryName;

  CountingUnitEcommerceOrdersVO(
      {this.countingUnitId,
      this.unitName,
      this.quantity,
      this.price,
      this.sizeId,
      this.size,
      this.itemTotalPrice,
      this.itemId,
      this.itemName,
      this.itemCode,
      this.photo,
      this.categoryId,
      this.category,
      this.subcategoryId,
      this.subcategoryName});

  CountingUnitEcommerceOrdersVO.fromJson(Map<String, dynamic> json) {
    countingUnitId = json['counting_unit_id'];
    unitName = json['unit_name'];
    quantity = json['quantity'];
    price = json['price'];
    sizeId = json['size_id'];
    size = json['size'];
    itemTotalPrice = json['item_total_price'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemCode = json['item_code'];
    photo = json['photo'];
    categoryId = json['category_id'];
    category = json['category'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counting_unit_id'] = this.countingUnitId;
    data['unit_name'] = this.unitName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['size_id'] = this.sizeId;
    data['size'] = this.size;
    data['item_total_price'] = this.itemTotalPrice;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_code'] = this.itemCode;
    data['photo'] = this.photo;
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    data['subcategory_id'] = this.subcategoryId;
    data['subcategory_name'] = this.subcategoryName;
    return data;
  }
}
