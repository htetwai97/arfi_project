import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:arfi_project/view/login/screen/login_screen.dart';
import 'package:arfi_project/view/profile/bloc/profile_bloc.dart';
import 'package:arfi_project/view/profile/widgets/account_box_widget.dart';
import 'package:arfi_project/view/profile/widgets/customer_function_list_tile_widget.dart';
import 'package:arfi_project/view/register/screen/register_screen.dart';
import 'package:arfi_project/view/reset_password/screen/reset_password_screen.dart';
import 'package:arfi_project/view/tracking_order/screen/tracking_order_screen.dart';
import 'package:arfi_project/view/update_profile/screen/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => ProfileBloc(),
          child: Consumer<ProfileBloc>(
            builder: (context, bloc, child) => Stack(
              alignment: Alignment.center,
              children: [
                Scaffold(
                  backgroundColor: MATERIAL_COLOR,
                  appBar: Functions.commonAppBar(
                      "Profile", context, bloc.cartLength ?? 0),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Selector<ProfileBloc, UserDataVO?>(
                          selector: (context, bloc) => bloc.user,
                          builder: (context, user, child) => AccountBoxWidget(
                            onTapEdit: () {
                              Functions.replacementTransition(
                                  context, const UpdateProfileScreen());
                            },
                            onTapLogout: () {
                              Functions.logoutDialog(
                                  context, scaleHeight(context) / 4, () {
                                Navigator.pop(context);
                              }, () {
                                var bloc = Provider.of<ProfileBloc>(context,
                                    listen: false);
                                bloc.onTapLogOut().then((value) {
                                  Functions.replacementTransition(
                                      context,
                                      const LoginScreen(
                                        isStart: true,
                                      ));
                                });
                              },
                                  "Are you sure to log out?",
                                  "You will be log out of your account and will need to login again later.",
                                  "Cancel",
                                  "OK");
                            },
                            name: user?.name ?? "",
                            email: user?.email ?? "",
                            phone: user?.phone ?? "",
                            address: user?.deliveredAddress ?? "",
                            isLogin: user != null,
                            onTapLogin: () {
                              Functions.replacementTransition(
                                  context, const LoginScreen());
                            },
                            onTapCreateAccount: () {
                              Functions.replacementTransition(
                                  context, const RegisterScreen());
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Selector<ProfileBloc, UserDataVO?>(
                          selector: (context, bloc) => bloc.user,
                          builder: (context, user, child) => Visibility(
                            visible: user != null,
                            child: CustomerFunctionListTileWidget(
                              onTapGoArrow: () {
                                Functions.replacementTransition(
                                    context, const ResetPasswordScreen());
                              },
                              title: "Change Password",
                              iconData: Icons.key,
                            ),
                          ),
                        ),
                        CustomerFunctionListTileWidget(
                          onTapGoArrow: () {
                            Functions.transition(
                                context, const TrackingOrderScreen());
                          },
                          title: "Track my order",
                          iconData: MdiIcons.truck,
                        ),
                        CustomerFunctionListTileWidget(
                          onTapGoArrow: () {},
                          title: "Help Center",
                          iconData: Icons.settings,
                        ),
                        CustomerFunctionListTileWidget(
                          onTapGoArrow: () {},
                          title: "Contact Us",
                          iconData: Icons.call,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: bloc.isLoading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
