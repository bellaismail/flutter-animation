import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigation{
  const CustomNavigation();
  call(Widget screen, {TransitionTypes? type, bool defaultNav = false, setting}) {
    if(type != null && !defaultNav) {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionDuration: const Duration(milliseconds: 900),
        reverseTransitionDuration: const Duration(milliseconds: 900),
        transitionsBuilder: (_, a1, a2, child) {
          return _transitionsBuilder(a1, child, type);
        },
        settings: setting,
      );
    }
    return MaterialPageRoute(builder: (context) => screen);
  }

  static Widget _transitionsBuilder(a1, child, TransitionTypes? type) {
    switch(type) {
      case TransitionTypes.slide:
        return _slideTransition(a1, child);
      case TransitionTypes.fade:
        return _fadeTransition(a1, child);
      case TransitionTypes.scale:
        return _scaleTransition(a1, child);
      case TransitionTypes.rotation:
        return _rotationTransition(a1, child);
      default:
        return _slideTransition(a1, child);
    }
  }

  static Widget _slideTransition(a1, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.decelerate));
    final animation = a1.drive(tween);
    return SlideTransition(position: animation, child: child);
  }
  static Widget _fadeTransition(a1, child) {
    final tween = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.decelerate)).animate(a1);
    return FadeTransition(opacity: tween, child: child);
  }
  static Widget _scaleTransition(a1, child) {
    final tween = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.decelerate)).animate(a1);
    return _fadeTransition(a1, ScaleTransition(scale: tween, child: child));
  }
  static Widget _rotationTransition(a1, child) {
    final tween = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.decelerate)).animate(a1);
    return _fadeTransition(a1, RotationTransition(turns: tween, child: child));
  }
}

enum TransitionTypes{
  slide,
  fade,
  scale,
  rotation,
}