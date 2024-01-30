import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class IconAndTitleProfileWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  const IconAndTitleProfileWidget({
    super.key,
    required this.title,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconData,
          color: SEPERATOR_COLOR,
          size: 20,
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Text(
            title,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              SEPERATOR_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
