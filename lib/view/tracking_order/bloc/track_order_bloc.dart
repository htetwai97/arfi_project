import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/order_vo.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:flutter/material.dart';

class TrackOrderBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Text Controllers
  TextEditingController phoneController = TextEditingController();

  /// Form Key
  final phoneFormKey = GlobalKey<FormState>();

  /// Focus Node
  final phoneFN = FocusNode();

  /// validation
  bool phoneV = false;

  /// Screen states
  UserDataVO? user;
  List<OrderVO>? orderList;
  bool isSearch = false;

  TrackOrderBloc() {
    _showLoading();
    user = _repository.getUser();
    _notifySafely();
    if (user != null) {
      _repository.postTrackOrder(user?.phone ?? "").then((response) {
        orderList = response.data;
        _notifySafely();
        _hideLoading();
      });
    } else {
      _hideLoading();
    }
  }

  void onSearch() {
    _showLoading();
    _repository.postTrackOrder(phoneController.text).then((response) {
      orderList = response.data
          ?.where((element) => element.customerId == null)
          .toList();
      phoneFN.unfocus();
      isSearch = true;
      _notifySafely();
      _hideLoading();
    });
  }

  String getMonthName(String monthNumber) {
    switch (monthNumber) {
      case "01":
        return 'Jan';
      case "02":
        return 'Feb';
      case "03":
        return 'March';
      case "04":
        return 'April';
      case "05":
        return 'May';
      case "06":
        return 'June';
      case "07":
        return 'July';
      case "08":
        return 'Aug';
      case "09":
        return 'Sep';
      case "10":
        return 'Oct';
      case "11":
        return 'Nov';
      case "12":
        return 'Dec';
      default:
        return 'Invalid month';
    }
  }

  void phoneValidate() {
    phoneV = (phoneFormKey.currentState?.validate() ?? false);
    _notifySafely();
  }

  /// loading situations
  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
