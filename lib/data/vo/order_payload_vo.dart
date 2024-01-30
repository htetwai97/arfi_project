import 'package:arfi_project/data/vo/cart_item_vo.dart';

class OrderPayLoadVO {
  int? customerId;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  int? totalQuantity;
  int? totalAmount;
  String? discountAmount;
  String? paymentType;
  String? deliverAddress;
  int? postalCode;
  int? b2bFlag;
  int? taxId;
  int? districtId;
  int? expressId;
  String? remainPrice;
  int? status;
  String? grandTotal;
  String? vatRate;
  String? preVat;
  String? deposit;
  List<CartItemVO?>? orders;

  OrderPayLoadVO({
    this.customerId,
    this.customerName,
    this.customerEmail,
    this.customerPhone,
    this.totalQuantity,
    this.totalAmount,
    this.discountAmount,
    this.paymentType,
    this.deliverAddress,
    this.postalCode,
    this.b2bFlag,
    this.taxId,
    this.districtId,
    this.expressId,
    this.remainPrice,
    this.status,
    this.grandTotal,
    this.vatRate,
    this.preVat,
    this.deposit,
    this.orders,
  });

  OrderPayLoadVO.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    totalQuantity = json['total_quantity'];
    totalAmount = json['total_amount'];
    discountAmount = json['discount_amount'];
    paymentType = json['payment_type'];
    deliverAddress = json['deliver_address'];
    status = json['status'];
    postalCode = json['postal_code'];
    b2bFlag = json['b2b_flag'];
    taxId = json['taxId'];
    districtId = json['district_id'];
    expressId = json['express_id'];
    grandTotal = json['grand_total'];
    deposit = json['deposit'];
    remainPrice = json['remain_price'];
    vatRate = json['vat_rate'];
    preVat = json['pre_vat'];
    if (json['orders'] != null) {
      orders = <CartItemVO>[];
      json['orders'].forEach((v) {
        orders!.add(new CartItemVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['customer_phone'] = this.customerPhone;
    data['total_quantity'] = this.totalQuantity;
    data['total_amount'] = this.totalAmount;
    data['discount_amount'] = this.discountAmount;
    data['payment_type'] = this.paymentType;
    data['deliver_address'] = this.deliverAddress;
    data['status'] = this.status;
    data['postal_code'] = this.postalCode;
    data['b2b_flag'] = this.b2bFlag;
    data['taxId'] = this.taxId;
    data['district_id'] = this.districtId;
    data['express_id'] = this.expressId;
    data['grand_total'] = this.grandTotal;
    data['remain_price'] = this.remainPrice;
    data['deposit'] = this.deposit;
    data['pre_vat'] = this.preVat;
    data['vat_rate'] = this.vatRate;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v!.toJson()).toList();
    }
    return data;
  }
}
