import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/vo/cart_item_vo.dart';
import 'package:arfi_project/data/vo/order_payload_vo.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:arfi_project/network/data_agent/dio_data_agent_impl.dart';
import 'package:arfi_project/network/response/get_bank_info_response.dart';
import 'package:arfi_project/network/response/get_blog_response.dart';
import 'package:arfi_project/network/response/get_charges_list_response.dart';
import 'package:arfi_project/network/response/get_color_response.dart';
import 'package:arfi_project/network/response/get_counting_unt_lists_response.dart';
import 'package:arfi_project/network/response/get_district_response.dart';
import 'package:arfi_project/network/response/get_express_response.dart';
import 'package:arfi_project/network/response/get_item_list_response.dart';
import 'package:arfi_project/network/response/get_size_list_response.dart';
import 'package:arfi_project/network/response/post_login_response.dart';
import 'package:arfi_project/network/response/post_register_response.dart';
import 'package:arfi_project/network/response/post_track_order_response.dart';
import 'package:arfi_project/persistence/hive/dao/cart_item_dao.dart';
import 'package:arfi_project/persistence/hive/dao/user_data_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl._internal();

  static final RepositoryImpl _singleton = RepositoryImpl._internal();

  factory RepositoryImpl() => _singleton;

  /// Dependency
  final _dataAgent = DioDataAgentImpl();
  final _userDao = UserDataDao();
  final _cartDao = CartItemDao();

  /// Network
  @override
  Future<GetColorsResponse> getColors() {
    return _dataAgent.getColors();
  }

  @override
  Future<GetCountingUnitsAllResponse> getCountingUnits() {
    return _dataAgent.getCountingUnits();
  }

  @override
  Future<GetSizeListResponse> getSizeList() {
    return _dataAgent.getSizeList();
  }

  @override
  Future<PostLoginResponse> postUserLogin(String email, String password) {
    return _dataAgent.postUserLogin(email, password);
  }

  @override
  Future<PostRegisterResponse> postUserRegister(String email, String password,
      String name, String userName, String phone, String address) {
    return _dataAgent.postUserRegister(
        email, password, name, userName, phone, address);
  }

  @override
  Future<PostLoginResponse> postPasswordUpdate(
      String id, String oldPW, String newPW, String confirmPW) {
    return _dataAgent.postPasswordUpdate(id, oldPW, newPW, confirmPW);
  }

  @override
  Future<void> postProfileUpdate(String id, String name, String userName,
      String address, String email, String phone) {
    return _dataAgent.postProfileUpdate(
        id, name, userName, address, email, phone);
  }

  @override
  Future<PostTrackOrderResponse> postTrackOrder(String phone) {
    return _dataAgent.postTrackOrder(phone);
  }

  @override
  Future<void> postOrderStore(OrderPayLoadVO orderPayLoad) {
    return _dataAgent.postOrderStore(orderPayLoad);
  }

  @override
  Future<GetBlogResponse> getBlogs() {
    return _dataAgent.getBlogs();
  }

  @override
  Future<GetItemListResponse> getItemList() {
    return _dataAgent.getItemList();
  }

  @override
  Future<GetCountingUnitsAllResponse> postCountingUnit(int sizeId, int itemId) {
    return _dataAgent.postCountingUnit(sizeId, itemId);
  }

  @override
  Future<GetDistrictResponse> getDistricts() {
    return _dataAgent.getDistricts();
  }

  @override
  Future<GetExpressResponse> getExpress() {
    return _dataAgent.getExpress();
  }

  @override
  Future<GetChargesListResponse> getCharges() {
    return _dataAgent.getCharges();
  }

  @override
  Future<GetChargesListResponse> postCharges(
      String districtId, String expressId) {
    return _dataAgent.postCharges(districtId, expressId);
  }

  @override
  Future<GetBankInfoResponse> getBankInfo() {
    return _dataAgent.getBankInfo();
  }

  /// Memory
  @override
  Future<void> deleteUser() {
    return _userDao.deleteUser();
  }

  @override
  UserDataVO? getUser() {
    return _userDao.getUser();
  }

  @override
  Future<void> saveUser(UserDataVO? user) {
    return _userDao.saveUser(user);
  }

  @override
  void deleteCartItem(int? countingUnitId) {
    _cartDao.deleteCartItem(countingUnitId);
  }

  @override
  Stream<List<CartItemVO?>?> getAllCartsStream() {
    return _cartDao
        .getAllCartEventStream()
        .startWith(_cartDao.getAllCartsStream())
        .map((event) => _cartDao.getAllCarts());
  }

  @override
  void saveCartItem(CartItemVO? cartItem) {
    _cartDao.saveCartItem(cartItem);
  }

  @override
  void clearCarts() {
    _cartDao.clearCarts();
  }
}
