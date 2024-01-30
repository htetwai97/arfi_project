import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/view/profile/widgets/guest_account_widget.dart';
import 'package:arfi_project/view/profile/widgets/login_user_account_widget.dart';
import 'package:flutter/material.dart';

class AccountBoxWidget extends StatelessWidget {
  final Function onTapLogin, onTapCreateAccount, onTapLogout, onTapEdit;
  final String name, email, phone, address;
  final bool isLogin;
  const AccountBoxWidget({
    super.key,
    required this.onTapLogin,
    required this.onTapCreateAccount,
    required this.onTapLogout,
    required this.onTapEdit,
    required this.isLogin,
    this.name = "",
    this.phone = "",
    this.email = "",
    this.address = "",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: scaleHeight(context) / 2.6,
          width: scaleWidth(context),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            color: Colors.grey.shade200,
          ),
          child: (isLogin)
              ? LoginUserAccountWidget(
                  name: name,
                  email: email,
                  phone: phone,
                  address: address,
                )
              : GuestAccountWidget(
                  onTapLogin: () {
                    onTapLogin();
                  },
                  onTapCreateAccount: () {
                    onTapCreateAccount();
                  },
                ),
        ),
        Visibility(
          visible: isLogin,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  onTapLogout();
                },
                icon: const Icon(
                  Icons.logout,
                  size: 20,
                  color: SEPERATOR_COLOR,
                ),
              ),
              IconButton(
                onPressed: () {
                  onTapEdit();
                },
                icon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: SEPERATOR_COLOR,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
