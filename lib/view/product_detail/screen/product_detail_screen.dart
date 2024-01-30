import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:arfi_project/view/product_detail/bloc/product_detail_bloc.dart';
import 'package:arfi_project/view/product_detail/widgets/banner_section_widget.dart';
import 'package:arfi_project/view/product_detail/widgets/product_info_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String gender, color, category;
  final int genderId, colorId, categoryId;

  const ProductDetailScreen({
    Key? key,
    required this.gender,
    required this.color,
    required this.category,
    required this.genderId,
    required this.colorId,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailBloc(
          color, gender, category, colorId, genderId, categoryId),
      child: Selector<ProductDetailBloc, bool>(
        selector: (context, bloc) => bloc.isLoading,
        builder: (context, isLoading, child) => (isLoading)
            ? Container(
                color: MATERIAL_COLOR,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Selector<ProductDetailBloc, bool>(
                selector: (context, bloc) => bloc.isApiCalling,
                builder: (context, isApiCalling, child) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Scaffold(
                      appBar:
                          Functions.commonAppBarForOrder(context, "Product"),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Consumer<ProductDetailBloc>(
                              builder: (context, bloc, child) {
                                return BannerSectionView(
                                  urlList: [
                                    bloc.photoPath,
                                    bloc.photoFront,
                                    bloc.photoEnd,
                                    bloc.photoLeft,
                                    bloc.photoRight,
                                  ],
                                );
                              },
                            ),
                            const SizedBox(
                              height: DIMEN_TWENTY_FOUR,
                            ),
                            Consumer<ProductDetailBloc>(
                              builder: (context, bloc, child) {
                                return ProductInfoSectionWidget(
                                  name: bloc.displayUnit?.itemName ?? "",
                                  description:
                                      "Smart ${bloc.displayUnit?.itemName} for ${bloc.displayUnit?.categoryName} health care professionals",
                                  price: "${bloc.price} Baht",
                                  stock: "${bloc.stock} Stocks",
                                  sizeList: bloc.sizeList,
                                  colorList: bloc.colorList,
                                  onSelectSize: (index) {
                                    if (bloc.isApiCalling == false) {
                                      bloc.onSelectSize(index);
                                    }
                                  },
                                  onSelectColor: (index) {
                                    if (bloc.isApiCalling == false) {
                                      bloc.onSelectColor(index);
                                    }
                                  },
                                  onTapAddToCart: () {
                                    Functions.logoutDialog(
                                      context,
                                      scaleHeight(context) / 4,
                                      () {
                                        Navigator.pop(context);
                                      },
                                      () {
                                        bloc.onTapAddToBag().then((value) {
                                          Navigator.pop(context);
                                          // Functions.replacementTransition(
                                          //     context,
                                          //     const BottomNavigationScreen(
                                          //         currentIndex: 1));
                                        }).onError((error, stackTrace) {
                                          debugPrint("Error==>$error");
                                          Navigator.pop(context);
                                        });
                                      },
                                      "Add To Bag",
                                      "Add ${bloc.displayUnit?.itemName}(${bloc.displayUnit?.subcategoryName})(${bloc.displayUnit?.sizeName}) to my shopping bag?",
                                      "Cancel",
                                      "OK",
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isApiCalling,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
