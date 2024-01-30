import 'package:arfi_project/data/vo/order_payload_vo.dart';
import 'package:arfi_project/network/api_service/api_constants.dart';
import 'package:arfi_project/network/api_service/api_service.dart';
import 'package:arfi_project/network/data_agent/dio_data_agent.dart';
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
import 'package:dio/dio.dart';

class DioDataAgentImpl extends DioDataAgent {
  DioDataAgentImpl._internal();
  static final DioDataAgentImpl _singleton = DioDataAgentImpl._internal();
  factory DioDataAgentImpl() => _singleton;

  @override
  Future<PostLoginResponse> postUserLogin(String email, String password) async {
    var data = {"email": email, "password": password};
    var dio = DioUtil.getDio();
    try {
      final response = await dio.post(URL_POST_LOGIN, data: data);
      if (response.statusCode == 200) {
        return PostLoginResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PostRegisterResponse> postUserRegister(String email, String password,
      String name, String userName, String phone, String address) async {
    var data = {
      "name": name,
      "username": userName,
      "delivered_address": address,
      "email": email,
      "phone": phone,
      "password": password
    };
    var dio = DioUtil.getDio();
    try {
      final response = await dio.post(URL_POST_REGISTER, data: data);
      if (response.statusCode == 200) {
        return PostRegisterResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PostLoginResponse> postPasswordUpdate(
      String id, String oldPW, String newPW, String confirmPW) async {
    var data = {
      "id": id,
      "old_password": oldPW,
      "new_password": newPW,
      "confirm_password": confirmPW
    };
    var dio = DioUtil.getDio();
    try {
      final response = await dio.post(URL_POST_PASSWORD_UPDATE, data: data);
      if (response.statusCode == 200) {
        return PostLoginResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postProfileUpdate(String id, String name, String userName,
      String address, String email, String phone) async {
    var data = {
      "name": name,
      "username": userName,
      "delivered_address": address,
      "email": email,
      "phone": phone,
      "id": id
    };
    var dio = DioUtil.getDio();
    try {
      final response = await dio.post(URL_POST_UPDATE_PROFILE, data: data);
      if (response.statusCode == 200) {
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetColorsResponse> getColors() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_GET_COLOR);
      if (response.statusCode == 200) {
        return GetColorsResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetCountingUnitsAllResponse> getCountingUnits() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_GET_COUNTING_UNITS);
      if (response.statusCode == 200) {
        return GetCountingUnitsAllResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetCountingUnitsAllResponse> postCountingUnit(
      int sizeId, int itemId) async {
    var dio = DioUtil.getDio();
    var data = {
      "unit": [sizeId, itemId]
    };
    try {
      final response = await dio.post(URL_POST_COUNTING_UNIT, data: data);
      if (response.statusCode == 200) {
        return GetCountingUnitsAllResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetSizeListResponse> getSizeList() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_GET_SIZE_LISTS);
      if (response.statusCode == 200) {
        return GetSizeListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PostTrackOrderResponse> postTrackOrder(String phone) async {
    var dio = DioUtil.getDio();
    dio.options.queryParameters = {"customer_phone": phone};
    try {
      final response = await dio.post(URL_POST_TRACK_ORDER);
      if (response.statusCode == 200) {
        return PostTrackOrderResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postOrderStore(OrderPayLoadVO orderPayLoad) async {
    var data = orderPayLoad.toJson();
    var dio = DioUtil.getDio();
    try {
      final response = await dio.post(URL_POST_ORDER_STORE, data: data);
      if (response.statusCode == 200) {
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetBlogResponse> getBlogs() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_GET_BLOG);
      if (response.statusCode == 200) {
        return GetBlogResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetItemListResponse> getItemList() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_GET_ITEM_LIST);
      if (response.statusCode == 200) {
        return GetItemListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetDistrictResponse> getDistricts() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_GET_DISTRICT);
      if (response.statusCode == 200) {
        return GetDistrictResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetExpressResponse> getExpress() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_GET_EXPRESS);
      if (response.statusCode == 200) {
        return GetExpressResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetChargesListResponse> getCharges() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_GET_CHARGES);
      if (response.statusCode == 200) {
        return GetChargesListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetChargesListResponse> postCharges(
      String districtId, String expressId) async {
    var data = {
      "expressCharges": [districtId, expressId]
    };
    var dio = DioUtil.getDio();
    try {
      final response = await dio.post(URL_POST_CHARGES, data: data);
      if (response.statusCode == 200) {
        return GetChargesListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetBankInfoResponse> getBankInfo() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(URL_BANK_INFO);
      if (response.statusCode == 200) {
        return GetBankInfoResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
