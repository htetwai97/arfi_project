import 'package:arfi_project/data/vo/charges_vo.dart';

class GetChargesListResponse {
  bool? error;
  String? message;
  List<ChargesVO>? data;

  GetChargesListResponse({this.error, this.message, this.data});

  GetChargesListResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ChargesVO>[];
      json['data'].forEach((v) {
        data!.add(new ChargesVO.fromJson(v));
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
