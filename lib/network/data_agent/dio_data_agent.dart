import 'package:arfi_project/data/vo/order_payload_vo.dart';
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

abstract class DioDataAgent {
  Future<GetColorsResponse> getColors();
  Future<GetCountingUnitsAllResponse> getCountingUnits();
  Future<GetSizeListResponse> getSizeList();
  Future<PostLoginResponse> postUserLogin(String email, String password);
  Future<PostRegisterResponse> postUserRegister(String email, String password,
      String name, String userName, String phone, String address);
  Future<PostLoginResponse> postPasswordUpdate(
      String id, String oldPW, String newPW, String confirmPW);
  Future<void> postProfileUpdate(String id, String name, String userName,
      String address, String email, String phone);
  Future<PostTrackOrderResponse> postTrackOrder(String phone);
  Future<void> postOrderStore(OrderPayLoadVO orderPayLoad);
  Future<GetBlogResponse> getBlogs();
  Future<GetItemListResponse> getItemList();
  Future<GetCountingUnitsAllResponse> postCountingUnit(int sizeId, int itemId);
  Future<GetDistrictResponse> getDistricts();
  Future<GetExpressResponse> getExpress();
  Future<GetChargesListResponse> getCharges();
  Future<GetChargesListResponse> postCharges(
      String districtId, String expressId);
  Future<GetBankInfoResponse> getBankInfo();
}
