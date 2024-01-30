import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/profile/widgets/icon_and_title_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginUserAccountWidget extends StatelessWidget {
  final String name, email, phone, address;
  const LoginUserAccountWidget({
    Key? key,
    this.name = "",
    this.phone = "",
    this.email = "",
    this.address = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: SEPERATOR_COLOR, width: 1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            color: SEPERATOR_COLOR,
            size: 70,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          height: scaleHeight(context) / 5,
          width: scaleWidth(context) / 1.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              Functions.buildBoxShadow(),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTitleProfileWidget(
                iconData: MdiIcons.faceWoman,
                title: name,
              ),
              IconAndTitleProfileWidget(
                iconData: MdiIcons.email,
                title: email,
              ),
              IconAndTitleProfileWidget(
                iconData: MdiIcons.phone,
                title: phone,
              ),
              IconAndTitleProfileWidget(
                iconData: MdiIcons.warehouse,
                title: address,
              ),
            ],
          ),
        )
      ],
    );
  }
}


