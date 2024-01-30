import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:flutter/foundation.dart';

class ShoppingBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  int? cartLength;
  ShoppingBloc(){
    _showLoading();
    _repository.getAllCartsStream().listen((event) {
      cartLength = event?.length;
      _notifySafely();
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
