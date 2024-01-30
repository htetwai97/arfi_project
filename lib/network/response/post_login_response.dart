import 'package:arfi_project/data/vo/user_data_vo.dart';

class PostLoginResponse {
  dynamic error;
  String? message;
  UserDataVO? data;

  PostLoginResponse({this.error, this.message, this.data});

  PostLoginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new UserDataVO.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
