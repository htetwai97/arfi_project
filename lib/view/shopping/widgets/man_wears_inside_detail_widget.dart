import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class ManWearsInsideDetailWidget extends StatelessWidget {
  final Function onPressManWears;
  const ManWearsInsideDetailWidget({
    super.key,
    required this.onPressManWears,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/man_i.jpg",
          fit: BoxFit.cover,
          width: scaleWidth(context) / 2.5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MAN WEARS",
              style: ConfigStyle.regularStyleThree(
                DIMEN_TWENTY,
                LEAVE_SCREEN_COLOR,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  LEAVE_SCREEN_COLOR,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: DIMEN_TWENTY_EIGHT),
                ),
              ),
              onPressed: () {
                onPressManWears();
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
      ],
    );
  }
}
