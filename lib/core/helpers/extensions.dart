import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../language/app_localizations.dart';

extension Navigation on BuildContext {
  // Get localized text
  String translate(String langKey) {
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }

  // Push a named route
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  // Push and replace the current route
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  // Push a named route and remove all previous routes until a specific one
  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  // Push a new screen with a custom transition
  Future<dynamic> pushWithTransition({
    required Widget screen,
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
    Duration duration = const Duration(milliseconds: 400),
    Duration reverseDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.of(this).push(
      PageTransition(
        type: transitionType,
        child: screen,
        duration: duration,
        reverseDuration: reverseDuration,
        curve: curve,
      ),
    );
  }
  Future<dynamic> pushWithPersistentBottomNavBar(Widget screen) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }
  // Push and replace a screen with a custom transition
  Future<dynamic> pushReplacementWithTransition({
    required Widget screen,
    bool withNavBar = false, // إضافة معامل withNavBar
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
    Duration duration = const Duration(milliseconds: 400),
    Duration reverseDuration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.of(this).pushReplacement(
      PageTransition(
        type: transitionType,
        child: screen,
        duration: duration,
        reverseDuration: reverseDuration,
        curve: curve,
      ),
    );
  }

  // Pop the current route
  void pop([dynamic result]) => Navigator.of(this).pop(result);

  // Pop until a certain condition is met
  void popUntil(RoutePredicate predicate) =>
      Navigator.of(this).popUntil(predicate);

  // Check if a route can pop
  bool canPop() => Navigator.of(this).canPop();

  // Push and clear stack until the initial route
  Future<dynamic> pushAndClearStack(Widget screen) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => screen),
          (route) => false,
    );
  }

  // General Navigator State Accessor
  NavigatorState get navigator => Navigator.of(this);
}

// Extension for String utilities
extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

// Extension for List utilities
extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
