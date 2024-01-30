import 'package:arfi_project/data/vo/blog_vo.dart';

class GetBlogResponse {
  bool? error;
  String? message;
  List<BlogVO>? data;
  int? total;
  int? page;
  int? rowPerPages;

  GetBlogResponse(
      {this.error,
      this.message,
      this.data,
      this.total,
      this.page,
      this.rowPerPages});

  GetBlogResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BlogVO>[];
      json['data'].forEach((v) {
        data!.add(new BlogVO.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    rowPerPages = json['rowPerPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['rowPerPages'] = this.rowPerPages;
    return data;
  }
}
