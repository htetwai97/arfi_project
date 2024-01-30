import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class WomanWearsInsideDetailWidget extends StatelessWidget {
  final Function onPressWomanWears;
  const WomanWearsInsideDetailWidget({
    super.key,
    required this.onPressWomanWears,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WOMAN WEARS",
              style: ConfigStyle.regularStyleThree(
                DIMEN_TWENTY,
                CATEGORY_ONE_COLOR_ONE,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  CATEGORY_ONE_COLOR_ONE,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: DIMEN_TWENTY_EIGHT),
                ),
              ),
              onPressed: () {
                onPressWomanWears();
              },
              child: Text(
                "Start Shopping",
                style: ConfigStyle.regularStyleThree(
                  DIMEN_FOURTEEN,
                  MATERIAL_COLOR,
                ),
              ),
            ),
          ],
        ),
        Image.asset(
          "assets/images/woman_i.jpg",
          fit: BoxFit.cover,
          width: scaleWidth(context) / 2.5,
        ),
      ],
    );
  }
}
