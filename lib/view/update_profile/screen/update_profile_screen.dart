import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:arfi_project/view/login/widgets/email_textfield_widget.dart';
import 'package:arfi_project/view/register/widgets/common_text_field_widget.dart';
import 'package:arfi_project/view/update_profile/bloc/update_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => UpdateProfileBloc(),
          child: Stack(
            children: [
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: scaleHeight(context) / 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              Functions.replacementTransition(
                                context,
                                const BottomNavigationScreen(
                                  currentIndex: 3,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Update your account",
                        style: ConfigStyle.boldStyleThree(
                          DIMEN_TWENTY,
                          SEPERATOR_COLOR,
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 30),
                      Consumer<UpdateProfileBloc>(
                        builder: (context, bloc, child) => Form(
                          key: bloc.nameFormKey,
                          child: CommonTextFieldWidget(
                            maxLine: 1,
                            title: "Name",
                            hint: "Enter Name",
                            descriptionController: bloc.nameController,
                            onChanged: () {
                              bloc.nameValidate();
                            },
                          ),
                        ),
                      ),
                      Consumer<UpdateProfileBloc>(
                        builder: (context, bloc, child) => Form(
                          key: bloc.userNameFormKey,
                          child: CommonTextFieldWidget(
                            maxLine: 1,
                            title: "Username",
                            hint: "Enter username",
                            descriptionController: bloc.userNameController,
                            onChanged: () {
                              bloc.userNameValidate();
                            },
                          ),
                        ),
                      ),
                      Consumer<UpdateProfileBloc>(
                        builder: (context, bloc, child) => Form(
                          key: bloc.emailFormKey,
                          child: EmailTextFieldWidget(
                            isRealLogin: false,
                            emailController: bloc.emailController,
                            onChanged: () {
                              bloc.emailValidate();
                            },
                          ),
                        ),
                      ),
                      Consumer<UpdateProfileBloc>(
                        builder: (context, bloc, child) => Form(
                          key: bloc.addressFormKey,
                          child: CommonTextFieldWidget(
                            maxLine: 1,
                            title: "Delivered Address",
                            hint: "Enter deliver address",
                            descriptionController: bloc.addressController,
                            onChanged: () {
                              bloc.addressValidate();
                            },
                          ),
                        ),
                      ),
                      Consumer<UpdateProfileBloc>(
                        builder: (context, bloc, child) => Form(
                          key: bloc.phoneFormKey,
                          child: CommonTextFieldWidget(
                            maxLine: 1,
                            title: "Phone",
                            hint: "Enter phone",
                            descriptionController: bloc.phoneController,
                            onChanged: () {
                              bloc.phoneValidate();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 50),
                      Consumer<UpdateProfileBloc>(
                        builder: (context, bloc, child) => MaterialButton(
                          onPressed: () {
                            if (bloc.isUpdateUnlock) {
                              bloc.onTapUpdate().then(
                                    (value) => Functions.replacementTransition(
                                      context,
                                      const BottomNavigationScreen(
                                          currentIndex: 3),
                                    ),
                                  );
                            }
                          },
                          minWidth: 240,
                          height: 40,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          color: bloc.isUpdateUnlock
                              ? SEPERATOR_COLOR
                              : Colors.grey,
                          child: Text(
                            "Update",
                            style: ConfigStyle.boldStyleTwo(
                                DIMEN_EIGHTEEN, MATERIAL_COLOR),
                          ),
                        ),
                      ),
                      SizedBox(height: scaleHeight(context) / 20),
                    ],
                  ),
                ),
              ),
              Selector<UpdateProfileBloc, bool>(
                selector: (context, bloc) => bloc.isLoading,
                builder: (context, isLoading, child) => Visibility(
                  visible: isLoading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
