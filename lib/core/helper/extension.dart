import 'package:flutter/material.dart';

import '../routing/app_routers.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: argument);
  }
  Future<dynamic> pushNamedAndRemoveUntilOTP(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(Routes.loginScreen), // Keep Login screen
      arguments: argument,
    );
  }



  /// Removes all previous pages and navigates to a new route
  Future<dynamic> removeAllAndPush(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: argument);
  }

  void pop([Object? result]) {
    return Navigator.of(this).pop(result);
  }

  void popUntil(String routeName) {
    return Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  Future<bool> maybePop([Object? result]) {
    return Navigator.of(this).maybePop(result);
  }
}
