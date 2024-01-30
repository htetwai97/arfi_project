import 'package:arfi_project/persistence/hive/constants/hive_constants.dart';
import 'package:hive/hive.dart';
part 'user_data_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_USER_VO, adapterName: "UserDataVOAdapter")
class UserDataVO {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  String? deliveredAddress;
  @HiveField(5)
  String? username;
  @HiveField(6)
  String? password;
  @HiveField(7)
  String? photo;
  @HiveField(8)
  String? registeredDate;
  @HiveField(9)
  String? authToken;
  @HiveField(10)
  bool? isAlwaysLogin;

  UserDataVO({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.deliveredAddress,
    this.username,
    this.password,
    this.photo,
    this.registeredDate,
    this.authToken,
    this.isAlwaysLogin,
  });

  UserDataVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    deliveredAddress = json['delivered_address'];
    username = json['username'];
    password = json['password'];
    photo = json['photo'];
    authToken = json['auth_token'];
    registeredDate = json['registered_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['delivered_address'] = this.deliveredAddress;
    data['username'] = this.username;
    data['password'] = this.password;
    data['photo'] = this.photo;
    data['registered_date'] = this.registeredDate;
    data['auth_token'] = this.authToken;
    return data;
  }
}
