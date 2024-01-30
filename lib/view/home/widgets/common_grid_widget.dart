import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/vo/counting_unit_vo.dart';
import 'package:arfi_project/view/home/widgets/home_item_detail_widget.dart';
import 'package:arfi_project/view/home/widgets/title_and_view_all_widget.dart';
import 'package:arfi_project/view/product_detail/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';

class CommonGridWidget extends StatelessWidget {
  final String title;
  final double itemHeight, itemWidth, mainExtent;
  final bool visibleTitle;
  final List<CountingUnitVO>? unitList;
  const CommonGridWidget({
    Key? key,
    required this.title,
    required this.itemWidth,
    required this.itemHeight,
    required this.mainExtent,
    this.visibleTitle = true,
    required this.unitList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DIMEN_SIXTEEN,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: visibleTitle,
            child: TitleAndViewAllWidget(title: title),
          ),
          const SizedBox(height: DIMEN_FOURTEEN),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: unitList?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: mainExtent,
              crossAxisSpacing: scaleWidth(context) / 20,
            ),
            itemBuilder: (context, index) {
              var unit = unitList?[index];
              return ItemDetailViewWidget(
                onTap: () {
                  // Functions.transition(
                  //   context,
                  //   ProductDetailScreen(
                  //     unit: unit,
                  //   ),
                  // );
                },
                name: unit?.itemName ?? "",
                photo: unit?.photoPath ?? "",
                description:
                    "Smart ${unit?.itemName} for ${unit?.categoryName} health care professionals",
                itemHeight: itemHeight,
                itemWidth: itemWidth,
              );
            },
          ),
        ],
      ),
    );
  }
}
