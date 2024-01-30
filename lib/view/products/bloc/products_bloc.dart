import 'package:arfi_project/data/vo/counting_unit_vo.dart';
import 'package:flutter/foundation.dart';

class ProductBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<CountingUnitVO>? unitList;
  String? color;
  String? gender;
  String? category;

  ProductBloc(this.unitList, String this.color, String this.gender,
      String this.category) {
    _showLoading();
    var list = unitList
        ?.where((element) =>
            element.subcategoryName == color &&
            element.categoryName == gender &&
            element.itemName == category)
        .toList();
    unitList = list;
    _notifySafely();
    _hideLoading();
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
