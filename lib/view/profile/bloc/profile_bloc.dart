import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:flutter/foundation.dart';

class ProfileBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  UserDataVO? user;
  int? cartLength;

  ProfileBloc() {
    _showLoading();
    _repository.getAllCartsStream().listen((event) {
      cartLength = event?.length;
      user = _repository.getUser();
      _notifySafely();
    });
    _hideLoading();
  }

  Future<void> onTapLogOut() async {
    _showLoading();
    await _repository.deleteUser();
    _hideLoading();
    return Future.value();
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
