import 'package:arfi_project/data/vo/express_vo.dart';

class GetExpressResponse {
  bool? error;
  String? message;
  List<ExpressVO>? data;

  GetExpressResponse({this.error, this.message, this.data});

  GetExpressResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ExpressVO>[];
      json['data'].forEach((v) {
        data!.add(new ExpressVO.fromJson(v));
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
