import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/color_vo.dart';
import 'package:flutter/foundation.dart';

class HomeBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  int? cartLength;
  List<ColorVO>? colorList;
  List<String>? maleColorList;
  List<String>? femaleColorList;

  HomeBloc() {
    _showLoading();
    _repository.getColors().then((response) {
      colorList = response.data;
      // var list1 =
      //     colorList?.where((element) => element.categoryId == 1).toList();
      // var list2 =
      //     colorList?.where((element) => element.categoryId == 2).toList();
      // maleColorList = (list1?.map((e) => e.photo ?? "").toList() ?? []);
      // femaleColorList = (list2?.map((e) => e.photo ?? "").toList() ?? []);
      maleColorList = [
        "assets/images/Front Photo Male.jpg",
        "assets/images/Front Photo Male-02.jpg",
        "assets/images/Front Photo Male-03.jpg",
        "assets/images/Front Photo Male-04.jpg",
        "assets/images/Front Photo Male-05.jpg",
        "assets/images/Front Photo Male-06.jpg",
      ];
      femaleColorList = [
        "assets/images/Front Photo Female (500px sq)-01.jpg",
        "assets/images/Front Photo Female (500px sq)-02.jpg",
        "assets/images/Front Photo Female (500px sq)-03.jpg",
        "assets/images/Front Photo Female (500px sq)-05.jpg",
        "assets/images/Front Photo Female (500px sq)-06.jpg",
        "assets/images/Front Photo Female (500px sq)-07.jpg",
        "assets/images/Front Photo Female (500px sq)-08.jpg",
        "assets/images/Front Photo Female (500px sq)-09.jpg",
      ];
      _notifySafely();
      _repository.getAllCartsStream().listen((event) {
        cartLength = event?.length;
        _notifySafely();
        _hideLoading();
      });
    }).onError((error, stackTrace) {
      debugPrint(
          "Error==> ${error.toString()}\nStackTrace==> ${stackTrace.toString()}");
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
