import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class GuestAccountWidget extends StatelessWidget {
  final Function onTapLogin;
  final Function onTapCreateAccount;
  const GuestAccountWidget({
    super.key,
    required this.onTapLogin,
    required this.onTapCreateAccount,
  });

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
        Text(
          "Guest",
          style: ConfigStyle.regularStyleThree(
            16,
            BLACK_HEAVY,
          ),
        ),
        MaterialButton(
          color: SEPERATOR_COLOR,
          minWidth: 260,
          onPressed: () {
            onTapLogin();
          },
          child: Text(
            "Login",
            style: ConfigStyle.regularStyleThree(
              14,
              MATERIAL_COLOR,
            ),
          ),
        ),
        MaterialButton(
          minWidth: 260,
          color: MATERIAL_COLOR,
          onPressed: () {
            onTapCreateAccount();
          },
          child: Text(
            "Creat An Account",
            style: ConfigStyle.regularStyleThree(
              14,
              SEPERATOR_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
