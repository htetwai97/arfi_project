import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/bank_info_vo.dart';
import 'package:arfi_project/data/vo/order_payload_vo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BankInfoBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// screen states
  OrderPayLoadVO? orderPayLoadVO;
  List<BankInfoVO>? bankInfoList;
  bool isOrderSuccess = false;
  bool isChecked = false;
  TextEditingController controller = TextEditingController();

  BankInfoBloc(OrderPayLoadVO orderPayLoadVO) {
    _showLoading();
    this.orderPayLoadVO = orderPayLoadVO;
    _repository.getBankInfo().then((response) {
      bankInfoList = response.data;
      _notifySafely();
      _hideLoading();
    }).onError((error, stackTrace) {
      debugPrint("Error==>$error\nStackTrace==>$stackTrace");
      _hideLoading();
    });
  }

  void onChecked(bool checkValue) {
    isChecked = checkValue;
    _notifySafely();
  }

  Future<void> onTapConfirm() async {
    _showApiLoading();
    var total = int.tryParse(orderPayLoadVO?.grandTotal ?? "0") ?? 0;
    var deposit = int.tryParse(controller.text) ?? 0;
    var remainder = total - deposit;
    orderPayLoadVO?.deposit = controller.text;
    orderPayLoadVO?.remainPrice = remainder.toString();
    await _repository
        .postOrderStore(orderPayLoadVO ?? OrderPayLoadVO())
        .then((value) {
      isOrderSuccess = true;
      _notifySafely();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      isOrderSuccess = false;
      _notifySafely();
      _hideApiLoading();
    });
    if (isOrderSuccess) {
      _repository.clearCarts();
      _hideApiLoading();
      return Future.value();
    } else {
      Functions.toast(msg: "Order Failed.", status: false);
      _hideApiLoading();
      return Future.error("error");
    }
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

  void _showApiLoading() {
    isApiCalling = true;
    _notifySafely();
  }

  void _hideApiLoading() {
    isApiCalling = false;
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
