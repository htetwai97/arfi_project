import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:flutter/material.dart';

class GenderBoxWidget extends StatelessWidget {
  final Widget child;
  const GenderBoxWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(context) / 3.3,
      width: scaleWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: DIMEN_FOURTEEN),
      decoration: BoxDecoration(
        color: MATERIAL_COLOR,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: child,
    );
  }
}
