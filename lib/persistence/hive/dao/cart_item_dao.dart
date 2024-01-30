import 'package:arfi_project/data/vo/cart_item_vo.dart';
import 'package:arfi_project/persistence/hive/constants/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartItemDao {
  static final CartItemDao _singleton = CartItemDao._internal();

  factory CartItemDao() {
    return _singleton;
  }
  CartItemDao._internal();

  /// Persistence

  void saveCartItem(CartItemVO? cartItem) async {
    await getCartBox().put(cartItem?.unitId, cartItem!);
  }

  void deleteCartItem(int? countingUnitId) async {
    await getCartBox().delete(countingUnitId);
  }

  void clearCarts() async {
    await getCartBox().clear();
  }

  List<CartItemVO?>? getAllCarts() {
    return getCartBox().values.toList();
  }

  /// Reactive

  Stream<void> getAllCartEventStream() {
    return getCartBox().watch();
  }

  Stream<List<CartItemVO?>?> getAllCartsStream() {
    return Stream.value(getAllCarts());
  }

  /// Box
  Box<CartItemVO> getCartBox() {
    return Hive.box<CartItemVO>(BOX_NAME_CART_ITEM_VO);
  }
}
