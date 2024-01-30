import 'package:arfi_project/data/vo/size_vo.dart';

class GetSizeListResponse {
  bool? error;
  String? message;
  List<SizeVO>? data;

  GetSizeListResponse({this.error, this.message, this.data});

  GetSizeListResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SizeVO>[];
      json['data'].forEach((v) {
        data!.add(new SizeVO.fromJson(v));
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
