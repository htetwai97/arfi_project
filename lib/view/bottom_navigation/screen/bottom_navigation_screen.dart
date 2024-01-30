import 'package:arfi_project/core/core_config/config_color.dart';
import 'package:arfi_project/core/core_config/config_dimension.dart';
import 'package:arfi_project/view/article/screen/article_screen.dart';
import 'package:arfi_project/view/home/screen/home_screen.dart';
import 'package:arfi_project/view/profile/screen/profile_screen.dart';
import 'package:arfi_project/view/shopping/screen/shopping_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  final int currentIndex;
  const BottomNavigationScreen({
    super.key,
    this.currentIndex = 0,
  });

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late int currentIndex;

  List<Widget> screens = [
    const HomeScreen(),
    const ShoppingScreen(),
    const ArticleScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        height: 60,
        backgroundColor: MATERIAL_COLOR,
        color: SEPERATOR_COLOR,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: const [
          Icon(
            Icons.home,
            size: DIMEN_EIGHTEEN,
            color: MATERIAL_COLOR,
          ),
          Icon(
            Icons.shop,
            size: DIMEN_EIGHTEEN,
            color: MATERIAL_COLOR,
          ),
          Icon(
            Icons.article_outlined,
            size: DIMEN_EIGHTEEN,
            color: MATERIAL_COLOR,
          ),
          Icon(
            Icons.person,
            size: DIMEN_EIGHTEEN,
            color: MATERIAL_COLOR,
          ),
        ],
      ),
    );
  }
}
