import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/blog_vo.dart';
import 'package:flutter/foundation.dart';

class ArticleBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<BlogVO>? blogList;
  int? cartLength;
  double? imageWidth;
  double? imageHeight;

  ArticleBloc() {
    _showLoading();
    _repository.getAllCartsStream().listen((event) {
      cartLength = event?.length;
      _notifySafely();
      _repository.getBlogs().then((response) {
        blogList = response.data;
        if (blogList != null && blogList?.length != 0) {
          for (int i = 0; i < blogList!.length; i++) {
            blogList![i].isExpanded = false;
          }
          _hideLoading();
        } else {
          _hideLoading();
        }
        _notifySafely();
      }).onError((error, stackTrace) {
        debugPrint(
            "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()} ");
      });
    });
  }

  void onTapReadMoreOrLess(int index) {
    blogList?[index].isExpanded = !(blogList?[index].isExpanded ?? false);
    _notifySafely();
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
