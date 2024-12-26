import 'package:flutter/material.dart';

class CustomTransition extends PageRouteBuilder {
  ///fade
  CustomTransition.fade({required Widget page}): super(
    pageBuilder: (_, a1, a2) => page,
    transitionsBuilder: (context, a1, a2, child) {
      final tween = Tween(begin: 0.0, end: 1.0)
          .chain(CurveTween(curve: Curves.decelerate))
          .animate(a1);
      return FadeTransition(opacity: tween, child: child);
    },
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 600),
  );

  ///scale
  CustomTransition.scale({required Widget page}): super(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, a1, a2, child) => ScaleTransition(
      scale: Tween(begin: 0.0, end: 1.0)
          .animate(CurvedAnimation(parent: a1, curve: Curves.decelerate)),
      alignment: Alignment.topCenter,
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 600),
  );

  ///size
  CustomTransition.size({required Widget page}): super(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, a1, a2, child) => Align(
      alignment: Alignment.center,
      child: SizeTransition(
        sizeFactor: a1,
        child: child,
      ),
    ),
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(milliseconds: 600),
  );

  ///rotation
  CustomTransition.rotation({required Widget page}): super(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, a1, a2, child) => RotationTransition(
      //end: 1.0 for only one turn.
      turns: Tween(begin: 0.0, end: 1.0)
          .chain(CurveTween(curve: Curves.decelerate))
          .animate(a1),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 600),
  );

  ///slide
  CustomTransition.slide({required Widget page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, a1, a2, child) {
            const begin = Offset(0, -1);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final Animation<Offset> animation = a1.drive(tween);
            return SlideTransition(
              position: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
          reverseTransitionDuration: const Duration(milliseconds: 600),
        );

  ///fade_side
  CustomTransition.fadeSide({required Widget page})
      : super(
          pageBuilder: (_, a1, a2) => page,
          transitionsBuilder: (_, a1, a2, child) => FadeTransition(
            opacity: a1,
            child: Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: a1,
                child: child,
              ),
            ),
          ),
        );

  ///scale_rotate
  CustomTransition.scaleRotate({required Widget page})
      : super(
    pageBuilder: (_, a1, a2) => page,
    transitionsBuilder: (_, a1, a2, child) => ScaleTransition(
      scale: a1,
      child: RotationTransition(
        turns: a1,
        child: child,
      ),
    ),
  );
}