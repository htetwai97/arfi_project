import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';


class ResetButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color color;
  const ResetButtonWidget({
    required this.title,
    required this.onTap,
    this.color = APP_THEME_COLOR,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: SizedBox(
        height: 40,
        width: 100,
        child: Center(
          child: Text(
            title,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              MATERIAL_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}
