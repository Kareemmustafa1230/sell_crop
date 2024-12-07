import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sell_your_crop/core/router/routers.dart';
import 'package:sell_your_crop/features/cart/ui/screen/cart.dart';
import 'package:sell_your_crop/features/home_screen/ui/screen/home.dart';
import 'package:sell_your_crop/features/search/ui/screen/search.dart';
import 'package:sell_your_crop/features/setting/ui/screen/setting.dart';


class HomeScreenWidget extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        colorBehindNavBar: Colors.white,
        border: const Border(
          top: BorderSide(
            color: Colors.green,
            width: 0.7,
          ),
        ),
      ),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress:PopBehavior.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: false,
      navBarHeight: 58.h,
      navBarStyle:NavBarStyle.style1, // Choose the nav bar style with this property
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      activeColorSecondary: Colors.green,
      iconSize: 28,
      icon: const Icon(CupertinoIcons.home),
      activeColorPrimary: Colors.green,
      scrollToTopOnNavBarItemPress: true,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      activeColorSecondary: Colors.green,
      icon: const Icon(CupertinoIcons.search),
      activeColorPrimary: Colors.green,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      activeColorSecondary: Colors.green,
      icon: const Icon(CupertinoIcons.cart),
      activeColorPrimary: Colors.green,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      activeColorSecondary: Colors.green,
      icon: const Icon(Icons.menu),
      activeColorPrimary: Colors.green,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}

List<Widget> _buildScreens() {
  return [
    Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
    ),
    Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => const Search(),
        );
      },
    ),
    Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => const Cart(),
        );
      },
    ),
    Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => const Setting(),
        );
      },
    ),
  ];
}
