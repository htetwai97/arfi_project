import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/cart_item_vo.dart';
import 'package:arfi_project/data/vo/district_vo.dart';
import 'package:arfi_project/data/vo/express_vo.dart';
import 'package:arfi_project/data/vo/order_payload_vo.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:flutter/material.dart';

class PaymentOneBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// text edit controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController deliFeeController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController taxIdController = TextEditingController();

  /// form keys
  final emailFormKey = GlobalKey<FormState>();
  final nameFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final postalCodeFormKey = GlobalKey<FormState>();
  final taxIdFormKey = GlobalKey<FormState>();

  /// validation
  bool emailV = false;
  bool nameV = false;
  bool addressV = false;
  bool phoneV = false;
  bool postalCodeV = false;
  bool taxIdV = false;

  /// Screen states
  UserDataVO? user;
  bool isGoToPayUnlock = false;
  String? paymentOption;
  String? district;
  String? express;
  List<CartItemVO?>? cartList;
  int totalCartQty = 0;
  int deliveryFee = 2000;
  bool isOrderSuccess = false;
  List<DistrictVO>? districtVOList;
  List<String> districtNameList = [];
  List<ExpressVO>? expressVOList;
  List<String> expressNameList = [];
  int? districtId;
  int? expressId;
  bool checkValue = false;
  OrderPayLoadVO? orderPayLoadVO;
  double mainSubTotal = 0;
  double discount = 873;
  double grandTotal = 0;
  double preVatPercentValue = 0;
  double preVatAmount = 0;

  PaymentOneBloc() {
    _showLoading();
    user = _repository.getUser();
    if (user != null) {
      nameController.text = user?.name ?? "";
      emailController.text = user?.email ?? "";
      phoneController.text = user?.phone ?? "";
      addressController.text = user?.deliveredAddress ?? "";
      nameV = true;
      emailV = true;
      phoneV = true;
      addressV = true;
    }
    _repository.getAllCartsStream().listen((event) {
      cartList = event;
      if (cartList != null && cartList?.length != 0) {
        mainSubTotal = cartList?.fold(
                0,
                (previousValue, cart) =>
                    previousValue! + cart!.itemTotalPrice!) ??
            0;
        totalCartQty = cartList?.fold(
                0, (previousValue, cart) => previousValue! + cart!.quantity!) ??
            0;
        grandTotal = mainSubTotal - discount;
        preVatAmount = grandTotal / 1.07;
        preVatPercentValue = preVatAmount * 0.07;
      }
      _repository.getDistricts().then((districtResponse) {
        districtVOList = districtResponse.data;
        districtNameList =
            districtVOList?.map((e) => e.districtName ?? "").toList() ?? [];
        _notifySafely();
        _repository.getExpress().then((expressResponse) {
          expressVOList = expressResponse.data;
          expressNameList =
              expressVOList?.map((e) => e.name ?? "").toList() ?? [];
          _notifySafely();
          _hideLoading();
        }).onError((error, stackTrace) {
          _hideLoading();
          debugPrint("Error==>$error\nStackTrace==>$stackTrace");
        });
      }).onError((error, stackTrace) {
        _hideLoading();
        debugPrint("Error==>$error\nStackTrace==>$stackTrace");
      });
    });
  }

  void onCheckB2B(bool isChecked) {
    checkValue = isChecked;
    _notifySafely();
    _validateAll();
  }

  Future<String> onTapGoToPayment() async {
    _showApiLoading();
    orderPayLoadVO = OrderPayLoadVO(
      customerId: user?.id,
      customerName: nameController.text,
      customerEmail: emailController.text,
      customerPhone: phoneController.text,
      totalQuantity: totalCartQty,
      totalAmount: mainSubTotal.toInt(),
      discountAmount: discount.toString(),
      paymentType: paymentOption,
      deliverAddress: addressController.text,
      postalCode: int.parse(postalCodeController.text),
      b2bFlag: (checkValue == true) ? 1 : 0,
      taxId: (taxIdController.text != "")
          ? int.tryParse(taxIdController.text)
          : null,
      districtId: districtId,
      expressId: expressId,
      remainPrice: null,
      status: 0,
      grandTotal: grandTotal.toStringAsFixed(2),
      vatRate: preVatPercentValue.toStringAsFixed(2),
      preVat: preVatAmount.toStringAsFixed(2),
      deposit: null,
      orders: cartList,
    );
    if (cartList != null && cartList?.length != 0 && paymentOption == "COD") {
      await _repository
          .postOrderStore(orderPayLoadVO ?? OrderPayLoadVO())
          .then((value) {
        isOrderSuccess = true;
        _notifySafely();
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
        isOrderSuccess = false;
        _notifySafely();
      });
      if (isOrderSuccess) {
        _repository.clearCarts();
        _hideApiLoading();
        return Future.value("COD");
      } else {
        Functions.toast(msg: "Order Failed.", status: false);
        _hideApiLoading();
        return Future.error("error");
      }
    } else {
      return Future.value("BANK");
    }
  }

  void onChoosePayment(String option) {
    paymentOption = option;
    _notifySafely();
    _validateAll();
  }

  void onChooseDistrict(String district) async {
    this.district = district;
    _notifySafely();
    var list = districtVOList
        ?.where((element) => element.districtName == this.district)
        .toList();
    list?.take(1);
    districtId = list?.elementAt(0).id ?? 0;
    if (expressId != null && expressId != 0) {
      await _getCharges(
          districtId?.toString() ?? "", expressId?.toString() ?? "");
    }
    _validateAll();
  }

  void onChooseExpress(String express) async {
    this.express = express;
    _notifySafely();
    var list = expressVOList
        ?.where((element) => element.name == this.express)
        .toList();
    list?.take(1);
    expressId = list?.elementAt(0).id ?? 0;
    if (districtId != null && districtId != 0) {
      await _getCharges(
          districtId?.toString() ?? "", expressId?.toString() ?? "");
    }
    _validateAll();
  }

  Future<void> _getCharges(String districtId, String expressId) async {
    deliFeeController.text = "";
    var response = await _repository.postCharges(districtId, expressId);
    var list = response.data;
    if (list != null && list.length != 0) {
      deliFeeController.text = list.elementAt(0).charges?.toString() ?? "";
      _notifySafely();
    } else {
      Functions.toast(msg: "Unavailable Route", status: false);
      _notifySafely();
    }
    return Future.value();
  }

  void emailValidate() {
    emailV = (emailFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void taxIdValidate() {
    taxIdV = (taxIdFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void nameValidate() {
    nameV = (nameFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void addressValidate() {
    addressV = (addressFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void postalCodeValidate() {
    postalCodeV = (postalCodeFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }
  // void deliFeeValidate() {
  //   deliFeeV = (deliFeeFormKey.currentState?.validate() ?? false);
  //   _notifySafely();
  //   _validateAll();
  // }

  void phoneValidate() {
    phoneV = (phoneFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void _validateAll() {
    if (checkValue == false) {
      if (emailV &&
          nameV &&
          addressV &&
          phoneV &&
          postalCodeV &&
          paymentOption != null &&
          district != null &&
          express != null &&
          deliFeeController.text != "") {
        isGoToPayUnlock = true;
        _notifySafely();
      } else {
        isGoToPayUnlock = false;
        _notifySafely();
      }
    } else {
      if (emailV &&
          nameV &&
          addressV &&
          taxIdV &&
          phoneV &&
          postalCodeV &&
          paymentOption != null &&
          district != null &&
          express != null &&
          deliFeeController.text != "") {
        isGoToPayUnlock = true;
        _notifySafely();
      } else {
        isGoToPayUnlock = false;
        _notifySafely();
      }
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
