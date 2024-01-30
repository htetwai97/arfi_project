import 'package:arfi_project/data/vo/counting_unit_vo.dart';

class GetCountingUnitsAllResponse {
  bool? error;
  String? message;
  List<CountingUnitVO>? unitLists;

  GetCountingUnitsAllResponse({this.error, this.message, this.unitLists});

  GetCountingUnitsAllResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['unitlists'] != null) {
      unitLists = <CountingUnitVO>[];
      json['unitlists'].forEach((v) {
        unitLists!.add(new CountingUnitVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.unitLists != null) {
      data['unitlists'] = this.unitLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
