import 'package:arfi_project/connection_test_service/scaffold_with_connection_status.dart';
import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:arfi_project/view/login/bloc/login_bloc.dart';
import 'package:arfi_project/view/login/widgets/email_textfield_widget.dart';
import 'package:arfi_project/view/login/widgets/password_text_field_widget.dart';
import 'package:arfi_project/view/register/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final bool isStart;
  const LoginScreen({
    Key? key,
    this.isStart = false,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithConnectionStatus(
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => LoginBloc(),
          child: Selector<LoginBloc, bool>(
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
                          visible: !widget.isStart,
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
                        SizedBox(height: scaleHeight(context) / 20),
                        Text(
                          "Login to your account",
                          style: ConfigStyle.boldStyleThree(
                            DIMEN_TWENTY,
                            SEPERATOR_COLOR,
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 10),
                        Consumer<LoginBloc>(
                          builder: (context, bloc, child) => Form(
                            key: bloc.emailFormKey,
                            child: EmailTextFieldWidget(
                              isRealLogin: true,
                              emailController: bloc.emailController,
                              onChanged: () {
                                bloc.emailValidate();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 60),
                        Consumer<LoginBloc>(
                          builder: (context, bloc, child) => Form(
                            key: bloc.passwordFormKey,
                            child: PasswordTextFieldWidget(
                              isRealLogin: true,
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
                        SizedBox(height: scaleHeight(context) / 60),
                        Row(
                          children: [
                            Consumer<LoginBloc>(
                              builder: (context, bloc, child) => Checkbox(
                                side: const BorderSide(color: Colors.black),
                                activeColor: SEPERATOR_COLOR,
                                checkColor: MATERIAL_COLOR,
                                value: checkValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkValue = newValue ?? false;
                                    bloc.onCheckRememberMe(newValue ?? false);
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Remember me?",
                              style: ConfigStyle.regularStyleOne(
                                DIMEN_SIXTEEN,
                                LOGIN_BUTTON_COLOR,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Functions.replacementTransition(
                                    context,
                                    RegisterScreen(
                                      isStart: widget.isStart,
                                    ));
                              },
                              child: Text(
                                "Sign Up",
                                style: ConfigStyle.regularStyleTwoWithUnderLine(
                                  DIMEN_SIXTEEN - 2,
                                  LOGIN_BUTTON_COLOR,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                        SizedBox(height: scaleHeight(context) / 10),
                        Consumer<LoginBloc>(
                          builder: (context, bloc, child) => MaterialButton(
                            onPressed: () {
                              if (bloc.isLoginUnlock && !isLoading) {
                                bloc.onTapLogin().then(
                                      (value) =>
                                          Functions.replacementTransition(
                                        context,
                                        const BottomNavigationScreen(),
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
                            color: bloc.isLoginUnlock
                                ? SEPERATOR_COLOR
                                : Colors.grey,
                            child: Text(
                              "Login",
                              style: ConfigStyle.boldStyleTwo(
                                  DIMEN_EIGHTEEN, MATERIAL_COLOR),
                            ),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Visibility(
                          visible: widget.isStart,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                              child: Text(
                                "OR",
                                style: ConfigStyle.boldStyleThree(
                                  16,
                                  BLACK_HEAVY,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: scaleHeight(context) / 20),
                        Visibility(
                          visible: widget.isStart,
                          child: Consumer<LoginBloc>(
                            builder: (context, bloc, child) => MaterialButton(
                              onPressed: () {
                                bloc.onTapContinueAsGuest().then((value) {
                                  Functions.replacementTransition(
                                      context, const BottomNavigationScreen());
                                });
                              },
                              minWidth: 240,
                              height: 40,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              color: MATERIAL_COLOR,
                              child: Text(
                                "Continue as Guest",
                                style: ConfigStyle.boldStyleTwo(
                                    DIMEN_EIGHTEEN, SEPERATOR_COLOR),
                              ),
                            ),
                          ),
                        ),
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
