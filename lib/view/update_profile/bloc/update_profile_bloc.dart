import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:flutter/material.dart';

class UpdateProfileBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  bool isUpdateUnlock = false;
  bool isUpdateSuccess = false;
  UserDataVO? user;

  /// text edit controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  /// form keys
  final emailFormKey = GlobalKey<FormState>();
  final nameFormKey = GlobalKey<FormState>();
  final userNameFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();

  /// validation
  bool emailV = false;
  bool nameV = false;
  bool userNameV = false;
  bool addressV = false;
  bool phoneV = false;

  UpdateProfileBloc() {
    _showLoading();
    user = _repository.getUser();
    nameController.text = user?.name ?? "";
    userNameController.text = user?.username ?? "";
    emailController.text = user?.email ?? "";
    addressController.text = user?.deliveredAddress ?? "";
    phoneController.text = user?.phone ?? "";
    _notifySafely();
    if (user != null) {
      isUpdateUnlock = true;
      _notifySafely();
    }
    _hideLoading();
  }

  Future onTapUpdate() async {
    _showLoading();
    await _repository
        .postProfileUpdate(
      user?.id?.toString() ?? "",
      nameController.text,
      userNameController.text,
      emailController.text,
      addressController.text,
      phoneController.text,
    )
        .then((response) {
      isUpdateSuccess = true;
      _notifySafely();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });

    if (isUpdateSuccess == true) {
      await _assignUser();
      Functions.toast(msg: "Account Updated", status: true);
      _hideLoading();
      return Future.value();
    } else {
      _hideLoading();
      Functions.toast(msg: "Incorrect Data", status: false);
      return Future.error("Error unknown yet");
    }
  }

  Future<void> _assignUser() {
    var user = UserDataVO(
      id: this.user?.id,
      name: nameController.text,
      username: userNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      deliveredAddress: addressController.text,
      photo: this.user?.photo,
      password: this.user?.password,
      registeredDate: this.user?.registeredDate,
      authToken: this.user?.authToken,
      isAlwaysLogin: this.user?.isAlwaysLogin,
    );
    return _repository.saveUser(user);
  }

  void emailValidate() {
    if (user != null) {
      emailV = (emailFormKey.currentState?.validate() ?? false);
      nameV = nameController.text.isNotEmpty;
      userNameV = userNameController.text.isNotEmpty;
      addressV = addressController.text.isNotEmpty;
      phoneV = phoneController.text.isNotEmpty;
      _notifySafely();
      _validateAll();
    } else {
      emailV = (emailFormKey.currentState?.validate() ?? false);
      _notifySafely();
      _validateAll();
    }
  }

  void nameValidate() {
    if (user != null) {
      nameV = (nameFormKey.currentState?.validate() ?? false);
      emailV = emailController.text.isNotEmpty;
      userNameV = userNameController.text.isNotEmpty;
      addressV = addressController.text.isNotEmpty;
      phoneV = phoneController.text.isNotEmpty;
      _notifySafely();
      _validateAll();
    } else {
      nameV = (nameFormKey.currentState?.validate() ?? false);
      _notifySafely();
      _validateAll();
    }
  }

  void userNameValidate() {
    if (user != null) {
      userNameV = (userNameFormKey.currentState?.validate() ?? false);
      nameV = nameController.text.isNotEmpty;
      emailV = emailController.text.isNotEmpty;
      addressV = addressController.text.isNotEmpty;
      phoneV = phoneController.text.isNotEmpty;
      _notifySafely();
      _validateAll();
    } else {
      userNameV = (userNameFormKey.currentState?.validate() ?? false);
      _notifySafely();
      _validateAll();
    }
  }

  void addressValidate() {
    if (user != null) {
      addressV = (addressFormKey.currentState?.validate() ?? false);
      userNameV = userNameController.text.isNotEmpty;
      nameV = nameController.text.isNotEmpty;
      emailV = emailController.text.isNotEmpty;
      phoneV = phoneController.text.isNotEmpty;
      _notifySafely();
      _validateAll();
    } else {
      addressV = (addressFormKey.currentState?.validate() ?? false);
      _notifySafely();
      _validateAll();
    }
  }

  void phoneValidate() {
    if (user != null) {
      phoneV = (phoneFormKey.currentState?.validate() ?? false);
      addressV = addressController.text.isNotEmpty;
      userNameV = userNameController.text.isNotEmpty;
      nameV = nameController.text.isNotEmpty;
      emailV = emailController.text.isNotEmpty;
      _notifySafely();
      _validateAll();
    } else {
      phoneV = (phoneFormKey.currentState?.validate() ?? false);
      _notifySafely();
      _validateAll();
    }
  }

  void _validateAll() {
    if (emailV && nameV && userNameV && addressV && phoneV) {
      isUpdateUnlock = true;
      _notifySafely();
    } else {
      isUpdateUnlock = false;
      _notifySafely();
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
