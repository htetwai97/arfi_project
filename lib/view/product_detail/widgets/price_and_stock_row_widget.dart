import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class PriceAndStockRowWidget extends StatelessWidget {
  final String price, stock;
  const PriceAndStockRowWidget({
    super.key,
    required this.price,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          price,
          style: ConfigStyle.regularStyleThree(
            DIMEN_SIXTEEN - 1,
            BLACK_HEAVY,
          ),
        ),
        Text(
          stock,
          style: ConfigStyle.regularStyleThree(
            DIMEN_SIXTEEN - 1,
            BLACK_HEAVY,
          ),
        ),
      ],
    );
  }
}
