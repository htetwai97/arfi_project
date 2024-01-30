import 'package:arfi_project/data/vo/bank_info_vo.dart';

class GetBankInfoResponse {
  bool? error;
  String? message;
  List<BankInfoVO>? data;

  GetBankInfoResponse({this.error, this.message, this.data});

  GetBankInfoResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BankInfoVO>[];
      json['data'].forEach((v) {
        data!.add(new BankInfoVO.fromJson(v));
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
