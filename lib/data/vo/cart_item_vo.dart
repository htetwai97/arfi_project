import 'package:arfi_project/persistence/hive/constants/hive_constants.dart';
import 'package:hive/hive.dart';
part 'cart_item_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_CART_ITEM_VO, adapterName: "CartItemVOAdapter")
class CartItemVO {
  @HiveField(0)
  int? itemTotalPrice;
  @HiveField(1)
  int? price;
  @HiveField(2)
  int? quantity;
  @HiveField(3)
  int? unitId;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? name;
  @HiveField(6)
  String? color;
  @HiveField(7)
  String? photo;
  @HiveField(8)
  int? stock;
  @HiveField(9)
  String? size;

  CartItemVO({
    this.itemTotalPrice,
    this.price,
    this.quantity,
    this.unitId,
    this.name,
    this.color,
    this.photo,
    this.gender,
    this.stock,
    this.size,
  });

  CartItemVO.fromJson(Map<String, dynamic> json) {
    itemTotalPrice = json['item_total_price'];
    price = json['price'];
    quantity = json['quantity'];
    unitId = json['unitid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_total_price'] = this.itemTotalPrice;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['unitid'] = this.unitId;
    return data;
  }
}
