import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/vo/item_vo.dart';
import 'package:arfi_project/network/api_service/api_constants.dart';
import 'package:arfi_project/view/category/bloc/category_bloc.dart';
import 'package:arfi_project/view/category/widgets/category_and_explore_widget_two.dart';
import 'package:arfi_project/view/product_detail/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final String color, gender;
  final int colorId, genderId;
  const CategoryScreen({
    Key? key,
    required this.gender,
    required this.color,
    required this.genderId,
    required this.colorId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category = "";
    if (gender == "male") {
      category = "Men";
    } else {
      category = "Women";
    }
    return ChangeNotifierProvider(
      create: (context) => CategoryBloc(color, gender),
      child: Selector<CategoryBloc, bool>(
        selector: (context, bloc) => bloc.isLoading,
        builder: (context, isLoading, child) => (isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: Functions.commonAppBarWithBack(
                    context, "$color($category)"),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: DIMEN_SIXTEEN, vertical: DIMEN_TWENTY),
                    child: Column(
                      children: [
                        Text(
                          "Tailor your shopping experience based on your specific needs and professional requirements.",
                          style: ConfigStyle.regularStyleThree(
                            DIMEN_FOURTEEN,
                            BLACK_HEAVY,
                          ),
                        ),
                        const SizedBox(height: DIMEN_TWENTY_FOUR),
                        Selector<CategoryBloc, List<ItemVO>?>(
                          selector: (context, bloc) => bloc.itemList,
                          builder: (context, itemList, child) =>
                              GridView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: DIMEN_FOURTEEN),
                            shrinkWrap: true,
                            itemCount: itemList?.length ?? 0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: scaleHeight(context) / 3,
                              crossAxisSpacing: scaleWidth(context) / 20,
                            ),
                            itemBuilder: (c, i) {
                              String url =
                                  "$IMAGE_BASE_URL/${itemList?[i].photoPath ?? ""}";
                              return CategoryAndExploreWidget(
                                name: itemList?[i]
                                        .itemName
                                        ?.toString()
                                        .toUpperCase() ??
                                    "",
                                description:
                                    itemList?[i].itemCode?.toString() ?? "",
                                url: url,
                                onTapExplore: () {
                                  Functions.transition(
                                    context,
                                    ProductDetailScreen(
                                      gender: gender,
                                      color: color,
                                      category: itemList?[i].itemName ?? "",
                                      genderId: genderId,
                                      colorId: colorId,
                                      categoryId: itemList?[i].id ?? 0,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
