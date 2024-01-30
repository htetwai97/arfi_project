import 'package:arfi_project/data/vo/order_vo.dart';

class PostTrackOrderResponse {
  bool? error;
  String? message;
  List<OrderVO>? data;
  int? orderTotal;
  int? page;

  PostTrackOrderResponse(
      {this.error, this.message, this.data, this.orderTotal, this.page});

  PostTrackOrderResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderVO>[];
      json['data'].forEach((v) {
        data!.add(new OrderVO.fromJson(v));
      });
    }
    orderTotal = json['order_total'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['order_total'] = this.orderTotal;
    data['page'] = this.page;
    return data;
  }
}
