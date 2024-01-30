import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class CustomerFunctionListTileWidget extends StatelessWidget {
  final Function onTapGoArrow;
  final IconData iconData;
  final String title;
  const CustomerFunctionListTileWidget({
    super.key,
    required this.onTapGoArrow,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: SEPERATOR_COLOR,
        size: 18,
      ),
      title: Text(
        title,
        style: ConfigStyle.regularStyleThree(
          14,
          SEPERATOR_COLOR,
        ),
      ),
      trailing: IconButton(
          onPressed: () {
            onTapGoArrow();
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: SEPERATOR_COLOR,
            size: 20,
          )),
    );
  }
}
