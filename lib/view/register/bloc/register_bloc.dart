import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/network/response/post_register_response.dart';
import 'package:flutter/material.dart';

class RegisterBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  bool isObscure = true;
  bool isSignUpUnlock = false;

  PostRegisterResponse? postRegisterResponse;

  /// text edit controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  /// form keys
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final nameFormKey = GlobalKey<FormState>();
  final userNameFormKey = GlobalKey<FormState>();
  final addressFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();

  /// validation
  bool emailV = false;
  bool passwordV = false;
  bool nameV = false;
  bool userNameV = false;
  bool addressV = false;
  bool phoneV = false;

  RegisterBloc();

  Future onTapSignUp() async {
    _showLoading();
    await _repository
        .postUserRegister(
            emailController.text,
            passwordController.text,
            nameController.text,
            userNameController.text,
            phoneController.text,
            addressController.text)
        .then((response) {
      postRegisterResponse = response;
      _notifySafely();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });

    if (postRegisterResponse != null) {
      Functions.toast(msg: "Account Registered", status: true);
      _hideLoading();
      return Future.value();
    } else {
      _hideLoading();
      Functions.toast(msg: "Incorrect Email or Password", status: false);
      return Future.error("Error value ==> ${postRegisterResponse.toString()}");
    }
  }

  void onTapVisibility() {
    isObscure = !isObscure;
    _notifySafely();
  }

  void emailValidate() {
    emailV = (emailFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void passwordValidate() {
    passwordV = (passwordFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void nameValidate() {
    nameV = (nameFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void userNameValidate() {
    userNameV = (userNameFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void addressValidate() {
    addressV = (addressFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void phoneValidate() {
    phoneV = (phoneFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateAll();
  }

  void _validateAll() {
    if (emailV && passwordV && nameV && userNameV && addressV && phoneV) {
      isSignUpUnlock = true;
      _notifySafely();
    } else {
      isSignUpUnlock = false;
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
