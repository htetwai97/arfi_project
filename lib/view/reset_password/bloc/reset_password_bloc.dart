import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:flutter/material.dart';

class ResetPasswordBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  bool isObscureOld = true;
  bool isObscureCreate = true;
  bool isObscureConfirm = true;
  bool _isResetUnlock = false;
  TextEditingController oldPasswordController = TextEditingController();
  final oldPasswordFormKey = GlobalKey<FormState>();
  TextEditingController createPasswordController = TextEditingController();
  final createPasswordFormKey = GlobalKey<FormState>();
  TextEditingController confPasswordController = TextEditingController();
  final confPasswordFromKey = GlobalKey<FormState>();
  bool isOldPWV = false;
  bool isCreatePWV = false;
  bool isConfirmPWV = false;
  bool isFABVisible = true;
  bool isOldPWCorrect = false;
  bool isNewPWCorrect = false;
  String oldPassword = "";
  FocusNode oldFocusNode = FocusNode();
  FocusNode createFocusNode = FocusNode();
  FocusNode confirmFocusNode = FocusNode();
  UserDataVO? userMemory;
  UserDataVO? userApi;

  ResetPasswordBloc() {
    _showLoading();
    oldFocusNode.addListener(_onOldFocusChange);
    createFocusNode.addListener(_onCreateFocusChange);
    confirmFocusNode.addListener(_onConfirmFocusChange);
    userMemory = _repository.getUser();
    oldPassword = userMemory?.password ?? "";
    _notifySafely();
    _hideLoading();
  }

  void _onOldFocusChange() {
    isFABVisible = !oldFocusNode.hasFocus;
    _notifySafely();
  }

  void _onCreateFocusChange() {
    isFABVisible = !createFocusNode.hasFocus;
    _notifySafely();
  }

  void _onConfirmFocusChange() {
    isFABVisible = !confirmFocusNode.hasFocus;
    _notifySafely();
  }

  void onTapVisibilityOld() {
    isObscureOld = !isObscureOld;
    _notifySafely();
  }

  void onTapVisibilityCreate() {
    isObscureCreate = !isObscureCreate;
    _notifySafely();
  }

  void onTapVisibilityConfirm() {
    isObscureConfirm = !isObscureConfirm;
    _notifySafely();
  }

  void oldPWValidate() {
    isOldPWV = (oldPasswordFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void createPWValidate() {
    isCreatePWV = (createPasswordFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void confirmPWValidate() {
    isConfirmPWV = (confPasswordFromKey.currentState?.validate() ?? false);
    _notifySafely();
    _validate();
  }

  void _validate() {
    if (isOldPWV &&
        isCreatePWV &&
        isConfirmPWV &&
        (createPasswordController.text == confPasswordController.text) &&
        (oldPasswordController.text == oldPassword)) {
      _isResetUnlock = true;
      _notifySafely();
    } else {
      _isResetUnlock = false;
      _notifySafely();
    }
  }

  void _oldPWCheck() {
    if (oldPasswordController.text == "") {
      isOldPWCorrect = false;
      _notifySafely();
      Functions.toast(msg: "Old password is empty", status: false);
    } else {
      if (oldPasswordController.text != oldPassword) {
        isOldPWCorrect = false;
        _notifySafely();
        Functions.toast(msg: "Old password incorrect", status: false);
      } else {
        isOldPWCorrect = true;
        _notifySafely();
      }
    }
  }

  void _newPasswordCheck() {
    if (createPasswordController.text == "" ||
        confPasswordController.text == "") {
      isNewPWCorrect = false;
      _notifySafely();
      Functions.toast(msg: "New Password is empty", status: false);
    } else {
      if (createPasswordController.text != confPasswordController.text) {
        isNewPWCorrect = false;
        _notifySafely();
        Functions.toast(msg: "New password Confirmation wrong", status: false);
      } else {
        isNewPWCorrect = true;
        _notifySafely();
      }
    }
  }

  Future onTapReset() async {
    _showLoading();
    _oldPWCheck();
    _newPasswordCheck();
    _validate();
    if (_isResetUnlock) {
      await _repository
          .postPasswordUpdate(
              userMemory?.id?.toString() ?? "",
              userMemory?.password ?? "",
              createPasswordController.text,
              confPasswordController.text)
          .then((response) {
        userApi = response.data;
        _notifySafely();
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
        Functions.toast(msg: "update password failed", status: false);
      });
      if (userApi != null) {
        await _assignUser(userApi, userMemory);
        Functions.toast(msg: "Password update successfully", status: true);
        await Future.delayed(const Duration(seconds: 1));
        _hideLoading();
        return Future.value();
      } else {
        _hideLoading();
        return Future.error("error");
      }
    } else {
      _hideLoading();
      return Future.error("error");
    }
  }

  Future<void> _assignUser(UserDataVO? userApi, UserDataVO? userMemory) {
    var user = UserDataVO(
      id: userApi?.id,
      name: userApi?.name,
      username: userApi?.username,
      email: userApi?.email,
      phone: userApi?.phone,
      deliveredAddress: userApi?.deliveredAddress,
      photo: userApi?.photo,
      password: confPasswordController.text,
      registeredDate: userApi?.registeredDate,
      authToken: userApi?.authToken,
      isAlwaysLogin: userMemory?.isAlwaysLogin,
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
