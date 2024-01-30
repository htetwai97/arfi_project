import 'package:arfi_project/data/vo/item_vo.dart';

class GetItemListResponse {
  bool? error;
  String? message;
  List<ItemVO>? data;

  GetItemListResponse({this.error, this.message, this.data});

  GetItemListResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ItemVO>[];
      json['data'].forEach((v) {
        data!.add(new ItemVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
