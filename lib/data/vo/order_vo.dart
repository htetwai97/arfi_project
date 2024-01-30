import 'package:arfi_project/data/vo/counting_unit_ecommerce_order_vo.dart';

class OrderVO {
  int? orderId;
  String? orderCode;
  String? orderDate;
  int? customerId;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  int? totalQuantity;
  int? totalAmount;
  int? deliveryFee;
  dynamic deliveredDate;
  dynamic deliveredBy;
  dynamic discountAmount;
  String? paymentType;
  String? paymentChannel;
  String? deliverAddress;
  List<CountingUnitEcommerceOrdersVO>? countingUnitEcommerceOrders;

  OrderVO(
      {this.orderId,
      this.orderCode,
      this.orderDate,
      this.customerId,
      this.customerName,
      this.customerEmail,
      this.customerPhone,
      this.totalQuantity,
      this.totalAmount,
      this.deliveryFee,
      this.deliveredDate,
      this.deliveredBy,
      this.discountAmount,
      this.paymentType,
      this.paymentChannel,
      this.deliverAddress,
      this.countingUnitEcommerceOrders});

  OrderVO.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderCode = json['order_code'];
    orderDate = json['order_date'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    totalQuantity = json['total_quantity'];
    totalAmount = json['total_amount'];
    deliveryFee = json['delivery_fee'];
    deliveredDate = json['delivered_date'];
    deliveredBy = json['delivered_by'];
    discountAmount = json['discount_amount'];
    paymentType = json['payment_type'];
    paymentChannel = json['payment_channel'];
    deliverAddress = json['deliver_address'];
    if (json['counting_unit_ecommerce_orders'] != null) {
      countingUnitEcommerceOrders = <CountingUnitEcommerceOrdersVO>[];
      json['counting_unit_ecommerce_orders'].forEach((v) {
        countingUnitEcommerceOrders!
            .add(new CountingUnitEcommerceOrdersVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_code'] = this.orderCode;
    data['order_date'] = this.orderDate;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['customer_phone'] = this.customerPhone;
    data['total_quantity'] = this.totalQuantity;
    data['total_amount'] = this.totalAmount;
    data['delivery_fee'] = this.deliveryFee;
    data['delivered_date'] = this.deliveredDate;
    data['delivered_by'] = this.deliveredBy;
    data['discount_amount'] = this.discountAmount;
    data['payment_type'] = this.paymentType;
    data['payment_channel'] = this.paymentChannel;
    data['deliver_address'] = this.deliverAddress;
    if (this.countingUnitEcommerceOrders != null) {
      data['counting_unit_ecommerce_orders'] =
          this.countingUnitEcommerceOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
