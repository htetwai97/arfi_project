import 'package:arfi_project/data/repo/repository.dart';
import 'package:arfi_project/data/repo/repository_impl.dart';
import 'package:arfi_project/data/vo/cart_item_vo.dart';
import 'package:arfi_project/data/vo/user_data_vo.dart';
import 'package:arfi_project/persistence/hive/constants/hive_constants.dart';
import 'package:arfi_project/view/article/screen/article_screen.dart';
import 'package:arfi_project/view/bank_info/screen/bank_info_screen.dart';
import 'package:arfi_project/view/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  /// hive init
  await Hive.initFlutter();

  /// register adapter
  Hive.registerAdapter(UserDataVOAdapter());
  Hive.registerAdapter(CartItemVOAdapter());

  /// box open
  await Hive.openBox<UserDataVO>(BOX_NAME_USER_VO);
  await Hive.openBox<CartItemVO>(BOX_NAME_CART_ITEM_VO);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
