import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:arfi_project/persistence/hive/constants/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserDataDao {
  static final UserDataDao _singleton = UserDataDao._internal();

  factory UserDataDao() {
    return _singleton;
  }
  UserDataDao._internal();

  Future<void> saveUser(UserDataVO? user) {
    return getUserBox().put(1, user!);
  }

  Future<void> deleteUser() {
    return getUserBox().delete(1);
  }

  UserDataVO? getUser() {
    return getUserBox().get(1);
  }

  /// Box
  Box<UserDataVO> getUserBox() {
    return Hive.box<UserDataVO>(BOX_NAME_USER_VO);
  }
}
