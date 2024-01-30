import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/item_vo.dart';
import 'package:flutter/foundation.dart';

class CategoryBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Loading State
  bool isLoading = false;

  /// Dependency
  Repository _repository = RepositoryImpl();

  /// Screen states
  String? color;
  String? gender;
  // List<String?>? categoryNames;
  List<ItemVO>? itemList;

  CategoryBloc(String this.color, String this.gender) {
    _showLoading();
    _repository.getItemList().then((response) {
      itemList = response.data
          ?.where((element) =>
              element.subcategoryName == color &&
              element.categoryName == gender)
          .toList();
      // categoryNames =
      //     itemList?.map((e) => e.id?.toString()).toList().toSet().toList();
      _notifySafely();
      _hideLoading();
    }).onError((error, stackTrace) {
      debugPrint(
          "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()}");
      _hideLoading();
    });
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
