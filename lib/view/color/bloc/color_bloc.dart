import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/color_vo.dart';
import 'package:flutter/foundation.dart';

class ColorBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;
  bool isSuccess = false;
  bool isFailed = false;

  /// Screen states
  List<ColorVO>? colorObjects;

  ColorBloc(String gender) {
    _loading();
    _repository.getColors().then((response) {
      var colorList = response.data;
      if (gender == "Man") {
        colorObjects = colorList
            ?.where((element) => element.categoryName == "male")
            .toList();
        _notifySafely();
      } else {
        colorObjects = colorList
            ?.where((element) => element.categoryName == "female")
            .toList();
        _notifySafely();
      }

      if (colorObjects != null) {
        _success();
      } else {
        _failed();
        Functions.toast(msg: "Something went wrong", status: false);
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      _failed();
    });
  }

  /// loading situations
  void _loading() {
    isLoading = true;
    isSuccess = false;
    isFailed = false;
    _notifySafely();
  }

  void _success() {
    isSuccess = true;
    isLoading = false;
    isFailed = false;
    _notifySafely();
  }

  void _failed() {
    isFailed = true;
    isSuccess = false;
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
