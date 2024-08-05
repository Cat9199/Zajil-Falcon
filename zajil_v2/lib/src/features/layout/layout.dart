import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zajil_v2/di.dart';
import 'package:zajil_v2/src/config/theme/color_manger.dart';

import 'package:zajil_v2/src/config/theme/styles.dart';
import 'package:zajil_v2/src/config/utils/assets_manger.dart';
import 'package:zajil_v2/src/features/menu/presentation/pages/menu_screen.dart';
import 'package:zajil_v2/src/features/ask_order/presentation/pages/ask_order.dart';
import 'package:zajil_v2/src/features/contact_us/presentation/pages/contact_us.dart';
import 'package:zajil_v2/src/features/orders/presentation/pages/orders_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  int orderIndex = 0;
  int menuIndex = 1;

  PageController pageController = PageController();
  @override
  void initState() {
    FlutterNativeSplash.remove();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          OrdersScreen(),
          MenuScreen(),
          AskOrderScreen(),
          ContactUsScreen()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            onTap: (value) {
              selectedIndex = value;

              pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);

              setState(() {});
            },
            currentIndex: selectedIndex,
            showSelectedLabels: true,
            selectedLabelStyle: font16blackSemiBold,
            unselectedLabelStyle: font13DarkBlackMedium,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorsManager.primaryColor,
            items: [
              BottomNavigationBarItem(
                  icon: iconHome(IconsManger.Home, 0), label: 'Orders'),
              BottomNavigationBarItem(
                  icon: iconHome(IconsManger.menu, 1), label: 'Menu'),
              BottomNavigationBarItem(
                  icon: iconHome(IconsManger.robot, 2), label: 'Ask Order'),
              BottomNavigationBarItem(
                  icon: iconHome(IconsManger.settings, 3), label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }

  SvgPicture iconHome(String icon, int index) {
    return SvgPicture.asset(
      icon,
      height: 25,
      width: 25,
      color: selectedIndex == index ? ColorsManager.primaryColor : null,
    );
  }
}
