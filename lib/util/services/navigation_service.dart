import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  static final currentContext = key.currentContext!;
}

extension Navigation on Widget {
  // Function to push a new screen with a Slide transition.
  Future push({
    BuildContext? context,
  }) async {
    return await Navigator.push(
      context ?? NavigationService.key.currentContext!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => this,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  Future pushReplacement({
    BuildContext? context,
  }) {
    return Navigator.pushReplacement(
      context ?? NavigationService.key.currentContext!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => this,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      ),
    );
  }

  Future pushAndRemoveUntil({
    BuildContext? context,
  }) {
    return Navigator.pushAndRemoveUntil(
      context ?? NavigationService.key.currentContext!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => this,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Define a scale transition
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }

  static void pop({BuildContext? context, String? msg}) {
    return Navigator.pop(
      context ?? NavigationService.key.currentContext!,
      msg,
    );
  }
}
