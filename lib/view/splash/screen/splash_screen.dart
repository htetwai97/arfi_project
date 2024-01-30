import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_functions/functions.dart';
import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/network/response/post_login_response.dart';
import 'package:arfi_project/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:arfi_project/view/login/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Repository repository = RepositoryImpl();
  PostLoginResponse? postLoginResponse;

  Future _autoLogin(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    await repository.postUserLogin(email, password).then((response) {
      postLoginResponse = response;
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
    if (postLoginResponse != null) {
      Functions.toast(msg: "Auto Login success", status: true);
      return Future.value();
    } else {
      return Future.error("e");
    }
  }

  Future _delayOnly() async {
    await Future.delayed(const Duration(seconds: 3));
    return Future.value();
  }

  @override
  void initState() {
    super.initState();
    var user = repository.getUser();
    if (user?.isAlwaysLogin == true) {
      var email = user?.email ?? "";
      var password = user?.password ?? "";
      _autoLogin(email, password).then((response) {
        Functions.replacementTransition(
            context, const BottomNavigationScreen());
      }).onError((error, stackTrace) {
        Functions.replacementTransition(
            context,
            const LoginScreen(
              isStart: true,
            ));
      });
    } else {
      _delayOnly().then((value) {
        Functions.replacementTransition(
            context,
            const LoginScreen(
              isStart: true,
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MATERIAL_COLOR,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: scaleWidth(context) / 2,
        ),
      ),
    );
  }
}
