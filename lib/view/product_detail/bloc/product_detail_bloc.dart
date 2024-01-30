import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/cart_item_vo.dart';
import 'package:arfi_project/data/vo/color_vo.dart';
import 'package:arfi_project/data/vo/counting_unit_vo.dart';
import 'package:arfi_project/data/vo/item_vo.dart';
import 'package:arfi_project/data/vo/size_vo.dart';
import 'package:flutter/foundation.dart';

class ProductDetailBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// Dependencies
  final Repository _repository = RepositoryImpl();

  /// Screen states
  List<CountingUnitVO>? unitList;
  List<CountingUnitVO>? displayUnitList;
  CountingUnitVO? displayUnit;
  List<SizeVO>? sizeList;
  List<ColorVO>? colorList;
  List<ItemVO>? itemList;
  int? cartLength;

  /// payload
  String? color;
  String? gender;
  String? category;
  int? colorId;
  int? genderId;
  int? itemId;
  int? sizeId = 1;
  String? size = "xs";

  String price = "calculating";
  String stock = "0";
  String photoPath = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
  String photoLeft = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
  String photoRight = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
  String photoFront = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
  String photoEnd = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";

  ProductDetailBloc(String this.color, String this.gender, String this.category,
      int this.colorId, int this.genderId, int this.itemId) {
    _showLoading();

    /// get counting unit
    _repository.postCountingUnit(sizeId ?? 0, itemId ?? 0).then((response) {
      unitList = response.unitLists;
      displayUnitList = unitList;
      _notifySafely();

      /// safe assign
      if (displayUnitList != null && displayUnitList?.length != 0) {
        var list = displayUnitList?.take(1);
        displayUnit = list?.elementAt(0);
        photoPath = displayUnit?.photoPath ??
            "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
        photoRight = displayUnit?.photoRight ??
            "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
        photoLeft = displayUnit?.photoLeft ??
            "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
        photoFront = displayUnit?.photoBody ??
            "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
        photoEnd = displayUnit?.photoBack ??
            "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
        price = displayUnit?.sellingPrice?.toString() ?? "calculating";
        stock = displayUnit?.currentQuantity?.toString() ?? "0";
        _notifySafely();
      }

      /// get sizes
      _repository.getSizeList().then((response) {
        sizeList = response.data;
        _notifySafely();
        if (sizeList != null && sizeList?.length != 0) {
          for (int i = 0; i < sizeList!.length; i++) {
            sizeList?[i].isSelected = false;
            _notifySafely();
          }
          sizeList?[0].isSelected = true;
          _notifySafely();
        }
        _repository.getColors().then((colorResponse) {
          colorList = colorResponse.data
              ?.where((element) => element.categoryName == gender)
              .toList();
          _notifySafely();
          if (colorList != null && colorList?.length != 0) {
            for (int i = 0; i < colorList!.length; i++) {
              colorList?[i].isSelected = false;
              _notifySafely();
            }
          }
          _repository.getItemList().then((itemResponse) {
            itemList = itemResponse.data;
            _notifySafely();
            _repository.getAllCartsStream().listen((event) {
              cartLength = event?.length;
              _notifySafely();
              _hideLoading();
            });
          }).onError((error, stackTrace) {
            debugPrint(
                "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()}");
          });
        }).onError((error, stackTrace) {
          debugPrint(
              "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()}");
        });
      }).onError((error, stackTrace) {
        _hideLoading();
        debugPrint(
            "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()}");
      });
    }).onError((error, stackTrace) {
      _hideLoading();
      debugPrint(
          "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()}");
    });
  }

  void onSelectSize(int index) {
    _showApiCalling();
    size = sizeList?[index].sizeName ?? "xs";
    sizeId = sizeList?[index].id ?? 1;
    _notifySafely();
    if (sizeList != null && sizeList?.length != 0) {
      for (int i = 0; i < sizeList!.length; i++) {
        sizeList?[i].isSelected = false;
        _notifySafely();
      }
      sizeList?[index].isSelected = true;
      _notifySafely();

      /// Reset counting unit
      _repository.postCountingUnit(sizeId ?? 0, itemId ?? 0).then((response) {
        unitList = response.unitLists;
        displayUnitList = unitList;
        _notifySafely();

        /// safety assign
        if (displayUnitList != null && displayUnitList?.length != 0) {
          var list = displayUnitList?.take(1);
          displayUnit = list?.elementAt(0);
          photoPath = displayUnit?.photoPath ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoRight = displayUnit?.photoRight ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoLeft = displayUnit?.photoLeft ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoFront = displayUnit?.photoBody ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoEnd = displayUnit?.photoBack ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          price = displayUnit?.sellingPrice?.toString() ?? "Calculating";
          stock = displayUnit?.currentQuantity?.toString() ?? "0";
          _notifySafely();
          _hideApiCalling();
        } else {
          price = "calculating";
          stock = "0";
          photoPath = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoRight =
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoLeft = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoFront =
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoEnd = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          _hideApiCalling();
        }
      });
    }
  }

  void onSelectColor(int index) {
    _showApiCalling();
    color = colorList?[index].subcategoryName ?? "";
    colorId = colorList?[index].id ?? 1;
    _notifySafely();
    var filteredItemList = itemList
        ?.where((element) =>
            element.categoryId == genderId &&
            element.subcategoryId == colorId &&
            element.itemName == category)
        .toList();
    if (filteredItemList != null && filteredItemList.length != 0) {
      itemId = filteredItemList.elementAt(0).id;
      _notifySafely();
    }
    if (colorList != null && colorList?.length != 0) {
      for (int i = 0; i < colorList!.length; i++) {
        colorList?[i].isSelected = false;
        _notifySafely();
      }
      colorList?[index].isSelected = true;
      _notifySafely();

      /// Reset counting unit
      _repository.postCountingUnit(sizeId ?? 0, itemId ?? 0).then((response) {
        unitList = response.unitLists;
        displayUnitList = unitList;
        _notifySafely();

        /// safety assign
        if (displayUnitList != null && displayUnitList?.length != 0) {
          var list = displayUnitList?.take(1);
          displayUnit = list?.elementAt(0);
          photoPath = displayUnit?.photoPath ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoRight = displayUnit?.photoRight ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoLeft = displayUnit?.photoLeft ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoFront = displayUnit?.photoBody ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoEnd = displayUnit?.photoBack ??
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          price = displayUnit?.sellingPrice?.toString() ?? "Calculating";
          stock = displayUnit?.currentQuantity?.toString() ?? "0";

          _notifySafely();
          _hideApiCalling();
        } else {
          price = "calculating";
          stock = "0";
          photoPath = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoRight =
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoLeft = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoFront =
              "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          photoEnd = "https://cdn-icons-png.flaticon.com/512/4961/4961689.png";
          _hideApiCalling();
        }
      });
    }
  }

  Future<void> onTapAddToBag() {
    if (stock != "0") {
      var cartItem = CartItemVO(
        unitId: displayUnit?.id,
        price: displayUnit?.sellingPrice,
        quantity: 1,
        itemTotalPrice: displayUnit?.sellingPrice,
        name: displayUnit?.itemName,
        gender: gender == "male" ? "Men" : "Women",
        color: color,
        photo: displayUnit?.photoPath,
        stock: int.parse(stock),
        size: displayUnit?.sizeName,
      );
      _repository.saveCartItem(cartItem);
      Functions.toast(msg: "One Item Added to Bag", status: false);
      return Future.value();
    } else {
      Functions.toast(msg: "No Stock for this size currently", status: false);
      return Future.error("error");
    }
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

  void _showApiCalling() {
    isApiCalling = true;
    _notifySafely();
  }

  void _hideApiCalling() {
    isApiCalling = false;
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
