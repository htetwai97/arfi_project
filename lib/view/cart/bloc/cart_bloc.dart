import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/cart_item_vo.dart';
import 'package:flutter/foundation.dart';

class CartBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<CartItemVO?>? cartList;
  double mainSubTotal = 0;
  double discount = 873;
  double grandTotal = 0;
  double preVatPercentValue = 0;
  double preVatAmount = 0;
  bool isVisiblePrice = false;

  CartBloc() {
    _showLoading();
    _repository.getAllCartsStream().listen((event) {
      cartList = event;
      _notifySafely();
      if (cartList != null && cartList?.length != 0) {
        mainSubTotal = cartList?.fold(
                0,
                (previousValue, cart) =>
                    previousValue! + cart!.itemTotalPrice!) ??
            0;
        grandTotal = mainSubTotal - discount;
        preVatAmount = grandTotal / 1.07;
        preVatPercentValue = preVatAmount * 0.07;
        _notifySafely();
      } else {
        mainSubTotal = 0.0;
        discount = 0.0;
        grandTotal = 0.0;
        preVatPercentValue = 0.0;
        preVatAmount = 0.0;
        _notifySafely();
        _hideLoading();
      }
    });
  }

  void onChangeFooter() {
    isVisiblePrice = !isVisiblePrice;
    _notifySafely();
  }

  void onTapRemoveItem(CartItemVO? oldCartItem) {
    _repository.deleteCartItem(oldCartItem?.unitId);
  }

  void onTapIncreaseItemQty(CartItemVO? oldCartItem) {
    var price = oldCartItem?.price ?? 0;
    var quantity = oldCartItem?.quantity ?? 0;
    var stock = oldCartItem?.stock ?? 0;
    if (quantity < stock) {
      quantity++;
    }
    var itemTotal = quantity * price;
    var newCart = CartItemVO(
      unitId: oldCartItem?.unitId,
      name: oldCartItem?.name,
      color: oldCartItem?.color,
      photo: oldCartItem?.photo,
      gender: oldCartItem?.gender,
      quantity: quantity,
      price: oldCartItem?.price,
      itemTotalPrice: itemTotal,
      size: oldCartItem?.size,
      stock: stock,
    );
    _repository.saveCartItem(newCart);
  }

  void onTapReduceItemQty(CartItemVO? oldCartItem) {
    var price = oldCartItem?.price ?? 0;
    var quantity = oldCartItem?.quantity ?? 0;
    var stock = oldCartItem?.stock ?? 0;
    if (quantity > 1) {
      quantity--;
    }
    var itemTotal = quantity * price;
    var newCart = CartItemVO(
      unitId: oldCartItem?.unitId,
      name: oldCartItem?.name,
      color: oldCartItem?.color,
      photo: oldCartItem?.photo,
      gender: oldCartItem?.gender,
      quantity: quantity,
      price: oldCartItem?.price,
      itemTotalPrice: itemTotal,
      size: oldCartItem?.size,
      stock: stock,
    );
    _repository.saveCartItem(newCart);
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
