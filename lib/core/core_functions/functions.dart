import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/core/core_config/config_style.dart';
import 'package:arfi_project/view/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:arfi_project/view/cart/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Functions {
  static void transition(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static void bottomTopUp(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.bottomToTop));
    });
  }

  static void rightToLeftTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.rightToLeft));
    });
  }

  static void replace(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      Navigator.removeRoute(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static void replacementTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.pushReplacement(
        context,
        PageTransition(child: screen, type: PageTransitionType.fade),
      );
    });
  }

  static toast({String? msg, bool? status}) {
    return Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: MATERIAL_COLOR,
      textColor: status == false ? Colors.red : BLACK_LIGHT,
      fontSize: 16.0,
    );
  }

  static buildBoxShadow() {
    return const BoxShadow(
      color: Colors.black12,
      offset: Offset(2, 2),
      spreadRadius: 0.3,
      blurRadius: 10,
      blurStyle: BlurStyle.outer,
    );
  }

  static void logoutDialog(
      BuildContext context,
      double height,
      Function onTapFirst,
      Function onTapSecond,
      String title,
      String content,
      String firstButtonName,
      String secondButtonName) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: MATERIAL_COLOR,
          title: Text(
            title,
            style: ConfigStyle.regularStyleThree(20, BLACK_HEAVY),
          ),
          content: Text(
            content,
            style: ConfigStyle.regularStyleOne(18, BLACK_HEAVY),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onTapFirst();
              },
              child: Text(
                firstButtonName,
                style: ConfigStyle.regularStyleThree(18, CARD_FIRST_COLOR),
              ),
            ),
            TextButton(
              onPressed: () {
                onTapSecond();
              },
              child: Text(
                secondButtonName,
                style: ConfigStyle.regularStyleThree(18, CARD_FIRST_COLOR),
              ),
            ),
          ],
        );
      },
    );
  }

  static commonAppBar(String? title, BuildContext context, int cartLength) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.deepPurple,
          size: DIMEN_TWENTY + 1,
        ),
      ),
      title: (title == null)
          ? Image.asset(
              "assets/images/logo.png",
              width: 100,
              height: 50,
            )
          : Text(
              title,
              style: ConfigStyle.regularStyleThree(
                DIMEN_SIXTEEN,
                Colors.deepPurple,
              ),
            ),
      actions: [
        // InkWell(
        //   onTap: () {},
        //   child: const Icon(
        //     Icons.favorite_border_outlined,
        //     color: Colors.deepPurple,
        //     size: DIMEN_TWENTY + 1,
        //   ),
        // ),
        // const SizedBox(width: 20),
        InkWell(
          onTap: () {
            transition(context, const CartScreen());
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              const SizedBox(
                width: 36,
                height: 36,
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.deepPurple,
                    size: DIMEN_TWENTY + 1,
                  ),
                ),
              ),
              Visibility(
                visible: cartLength != 0,
                child: Text(
                  cartLength.toString(),
                  style: ConfigStyle.boldStyleThree(
                    14,
                    SEPERATOR_COLOR,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: DIMEN_SIXTEEN),
      ],
    );
  }

  static commonAppBarWithBack(BuildContext context, String? title) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      leadingWidth: 100,
      leading: Row(
        children: [
          const SizedBox(width: DIMEN_SIXTEEN),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.deepPurple,
              size: DIMEN_TWENTY + 1,
            ),
          ),
          // const SizedBox(width: DIMEN_SIXTEEN),
          // InkWell(
          //   onTap: () {},
          //   child: const Icon(
          //     Icons.search,
          //     color: Colors.deepPurple,
          //     size: DIMEN_TWENTY + 1,
          //   ),
          // ),
        ],
      ),
      title: (title == null)
          ? null
          : Text(
              title,
              style: ConfigStyle.regularStyleThree(
                DIMEN_SIXTEEN,
                Colors.deepPurple,
              ),
            ),
      // actions: [
      //   InkWell(
      //     onTap: () {},
      //     child: const Icon(
      //       Icons.favorite_border_outlined,
      //       color: Colors.deepPurple,
      //       size: DIMEN_TWENTY + 1,
      //     ),
      //   ),
      //   const SizedBox(width: 20),
      //   InkWell(
      //     onTap: () {},
      //     child: const Icon(
      //       Icons.shopping_bag_outlined,
      //       color: Colors.deepPurple,
      //       size: DIMEN_TWENTY + 1,
      //     ),
      //   ),
      //   const SizedBox(width: DIMEN_SIXTEEN),
      // ],
    );
  }

  static commonAppBarForOrder(BuildContext context, String? title) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      leadingWidth: 100,
      leading: Row(
        children: [
          const SizedBox(width: DIMEN_SIXTEEN),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.deepPurple,
              size: DIMEN_TWENTY + 1,
            ),
          ),
        ],
      ),
      title: (title == null)
          ? Image.asset(
              "assets/images/logo.png",
              width: 100,
              height: 50,
            )
          : Text(
              title,
              style: ConfigStyle.regularStyleThree(
                DIMEN_SIXTEEN,
                Colors.deepPurple,
              ),
            ),
      actions: [
        InkWell(
          onTap: () {
            Functions.replacementTransition(
                context,
                const BottomNavigationScreen(
                  currentIndex: 1,
                ));
          },
          child: const Icon(
            Icons.shop,
            color: Colors.deepPurple,
            size: DIMEN_TWENTY + 1,
          ),
        ),
        const SizedBox(width: DIMEN_SIXTEEN),
      ],
    );
  }
}
