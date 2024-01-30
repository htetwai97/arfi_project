import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:arfi_project/network/response/post_login_response.dart';
import 'package:flutter/material.dart';

class LoginBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  bool isObscure = true;
  bool isLoginUnlock = false;
  PostLoginResponse? postLoginResponse;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  bool emailV = false;
  bool passwordV = false;
  bool isChecked = false;

  LoginBloc();

  void onTapVisibility() {
    isObscure = !isObscure;
    _notifySafely();
  }

  void emailValidate() {
    emailV = (emailFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void passwordValidate() {
    passwordV = (passwordFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void _validate() {
    if (emailV && passwordV) {
      isLoginUnlock = true;
      _notifySafely();
    } else {
      isLoginUnlock = false;
      _notifySafely();
    }
  }

  void onCheckRememberMe(bool isChecked) {
    this.isChecked = isChecked;
    _notifySafely();
  }

  Future<void> onTapContinueAsGuest() async {
    _showLoading();
    await _repository.deleteUser();
    _hideLoading();
    return Future.value();
  }

  Future onTapLogin() async {
    _showLoading();
    await _repository
        .postUserLogin(emailController.text, passwordController.text)
        .then((response) {
      postLoginResponse = response;
      _notifySafely();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });

    if (postLoginResponse != null) {
      if (isChecked) {
        await _assignUser(postLoginResponse, true);
      } else {
        await _assignUser(postLoginResponse, false);
      }
      Functions.toast(msg: "Login success", status: true);
      _hideLoading();
      return Future.value();
    } else {
      _hideLoading();
      Functions.toast(msg: "Incorrect Email or Password", status: false);
      return Future.error("Error value ==> ${postLoginResponse.toString()}");
    }
  }

  Future<void> _assignUser(
      PostLoginResponse? postLoginResponse, bool isAlwaysLogin) {
    var user = UserDataVO(
      id: postLoginResponse?.data?.id,
      name: postLoginResponse?.data?.name,
      username: postLoginResponse?.data?.username,
      email: postLoginResponse?.data?.email,
      phone: postLoginResponse?.data?.phone,
      deliveredAddress: postLoginResponse?.data?.deliveredAddress,
      photo: postLoginResponse?.data?.photo,
      password: passwordController.text,
      registeredDate: postLoginResponse?.data?.registeredDate,
      authToken: postLoginResponse?.data?.authToken,
      isAlwaysLogin: isAlwaysLogin,
    );
    return _repository.saveUser(user);
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
