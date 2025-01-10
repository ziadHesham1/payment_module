import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  ///push
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  /// push named
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// push replacement named
  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// push named and remove until
  void pushNamedAndRemoveUntil(String routeName,
      {required RoutePredicate predicate, Object? arguments}) {
    Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, arguments: arguments, predicate);
  }

  /// pop
  void pop() {
    Navigator.of(this).pop();
  }
}
