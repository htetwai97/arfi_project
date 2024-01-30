import 'package:arfi_project/data/vo/district_vo.dart';

class GetDistrictResponse {
  bool? error;
  String? message;
  List<DistrictVO>? data;

  GetDistrictResponse({this.error, this.message, this.data});

  GetDistrictResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DistrictVO>[];
      json['data'].forEach((v) {
        data!.add(new DistrictVO.fromJson(v));
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
