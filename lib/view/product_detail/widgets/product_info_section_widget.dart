import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/data/vo/color_vo.dart';
import 'package:arfi_project/data/vo/size_vo.dart';
import 'package:arfi_project/view/product_detail/widgets/add_to_bag_button.dart';
import 'package:arfi_project/view/product_detail/widgets/color_list_widget.dart';
import 'package:arfi_project/view/product_detail/widgets/price_and_stock_row_widget.dart';
import 'package:arfi_project/view/product_detail/widgets/size_list_widget.dart';
import 'package:flutter/material.dart';

class ProductInfoSectionWidget extends StatelessWidget {
  final String name, description, price, stock;
  final List<SizeVO?>? sizeList;
  final List<ColorVO>? colorList;
  final Function(int) onSelectSize;
  final Function(int) onSelectColor;
  final Function onTapAddToCart;
  const ProductInfoSectionWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.sizeList,
    required this.colorList,
    required this.onSelectSize,
    required this.onSelectColor,
    required this.onTapAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DIMEN_SIXTEEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: ConfigStyle.boldStyleThree(
              DIMEN_SIXTEEN,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(
            height: DIMEN_FOURTEEN - 4,
          ),
          PriceAndStockRowWidget(
            price: price,
            stock: stock,
          ),
          const SizedBox(
            height: DIMEN_FOURTEEN,
          ),
          Text(
            description,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(
            height: DIMEN_TWENTY,
          ),
          Text(
            "Size",
            style: ConfigStyle.boldStyleOne(
              DIMEN_SIXTEEN,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(
            height: DIMEN_FOURTEEN - 4,
          ),
          SizeListWidget(
            sizeList: sizeList,
            onSelectSize: (index) {
              onSelectSize(index);
            },
          ),
          const SizedBox(
            height: DIMEN_TWENTY_EIGHT,
          ),
          Text(
            "Wanna See this design with other colors?",
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(
            height: DIMEN_FOURTEEN,
          ),
          ColorListWidget(
            colorList: colorList,
            onTapColor: (index) {
              onSelectColor(index);
            },
          ),
          const SizedBox(
            height: DIMEN_TWENTY-10,
          ),
          const Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios_outlined,
                color: BLACK_LIGHT,
                size: 13,
              ),
              Icon(
                Icons.arrow_back_ios_outlined,
                color: BLACK_LIGHT,
                size: 13,
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: BLACK_LIGHT,
                size: 13,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: BLACK_LIGHT,
                size: 13,
              ),
            ],
          ),
          const SizedBox(
            height: DIMEN_FOURTEEN,
          ),
          AddToBagButton(
            onTap: () {
              onTapAddToCart();
            },
          ),
          const SizedBox(
            height: DIMEN_TWENTY,
          ),
        ],
      ),
    );
  }
}
