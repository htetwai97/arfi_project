import 'package:arfi_project/data/vo/color_vo.dart';

class GetColorsResponse {
  bool? error;
  String? message;
  List<ColorVO>? data;

  GetColorsResponse({this.error, this.message, this.data});

  GetColorsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ColorVO>[];
      json['data'].forEach((v) {
        data!.add(new ColorVO.fromJson(v));
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
