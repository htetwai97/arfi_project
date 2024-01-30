import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:arfi_project/view/login/screen/login_screen.dart';
import 'package:arfi_project/view/login/widgets/email_textfield_widget.dart';
import 'package:arfi_project/view/login/widgets/password_text_field_widget.dart';
import 'package:arfi_project/view/register/bloc/register_bloc.dart';
import 'package:arfi_project/view/register/widgets/common_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final bool isStart;
  const RegisterScreen({Key? key, this.isStart = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => RegisterBloc(),
          child: Selector<RegisterBloc, bool>(
            selector: (context, bloc) => bloc.isLoading,
            builder: (context, isLoading, child) => Stack(
              alignment: Alignment.center,
              children: [
                Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: scaleHeight(context) / 20),
                        Visibility(
                          visible: !isStart,
                          child: Align(
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
                        ),
                        Text(
                          "Register your account",
                          style: ConfigStyle.boldStyleThree(
                            DIMEN_TWENTY,
                            SEPERATOR_COLOR,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 30),
                        Consumer<RegisterBloc>(
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
                        Consumer<RegisterBloc>(
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
                        Consumer<RegisterBloc>(
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
                        Consumer<RegisterBloc>(
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
                        Consumer<RegisterBloc>(
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
                        Consumer<RegisterBloc>(
                          builder: (context, bloc, child) => Form(
                            key: bloc.passwordFormKey,
                            child: PasswordTextFieldWidget(
                              isRealLogin: false,
                              passwordController: bloc.passwordController,
                              isObscure: bloc.isObscure,
                              onPressedVisibleIcon: () {
                                bloc.onTapVisibility();
                              },
                              onChanged: () {
                                bloc.passwordValidate();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Already Have an Account?",
                              style: ConfigStyle.regularStyleThree(
                                DIMEN_SIXTEEN - 2,
                                SEPERATOR_COLOR,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Functions.replacementTransition(
                                    context,
                                    LoginScreen(
                                      isStart: isStart,
                                    ));
                              },
                              child: Text(
                                "Login",
                                style: ConfigStyle.regularStyleTwoWithUnderLine(
                                  DIMEN_SIXTEEN - 2,
                                  LOGIN_BUTTON_COLOR,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Consumer<RegisterBloc>(
                          builder: (context, bloc, child) => MaterialButton(
                            onPressed: () {
                              if (bloc.isSignUpUnlock && !isLoading) {
                                bloc.onTapSignUp().then(
                                      (value) =>
                                          Functions.replacementTransition(
                                        context,
                                        const LoginScreen(isStart: true),
                                      ),
                                    );
                              }
                            },
                            minWidth: 240,
                            height: 40,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            color: bloc.isSignUpUnlock
                                ? SEPERATOR_COLOR
                                : Colors.grey,
                            child: Text(
                              "Sign Up",
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
                Visibility(
                  visible: isLoading,
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
