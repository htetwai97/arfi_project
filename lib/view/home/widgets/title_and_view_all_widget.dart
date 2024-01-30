import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class TitleAndViewAllWidget extends StatelessWidget {
  const TitleAndViewAllWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: ConfigStyle.boldStyleThree(
            DIMEN_SIXTEEN,
            BLACK_HEAVY,
          ),
        ),
        Text(
          "View All",
          style: ConfigStyle.regularStyleTwoWithUnderLine(
            DIMEN_FOURTEEN,
            BLACK_HEAVY,
          ),
        ),
      ],
    );
  }
}
