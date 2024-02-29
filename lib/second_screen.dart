import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ShakeCurve extends Curve {
  @override
  double transform(double t) => math.sin(t * math.pi * 2);
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 12).animate(controller)
      ..addListener(() {
        if (animation.isCompleted) {
          controller.reverse();
        } else if (animation.isDismissed) {
          controller.forward();
        }
      });
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut)
    //   ..addStatusListener((status) {
    //     if (animation.isCompleted) {
    //       controller.reverse();
    //     } else if (animation.isDismissed) {
    //       controller.forward();
    //     }
    //   });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        // child: AnimatedBoxContainer(animation: animation),
        // child: AnimatedTweenBoxContainer(animation: animation),
        child: AnimatedTweenContainer(animation: animation),
      ),
    );
  }
}

class AnimatedBoxContainer extends AnimatedWidget {
  const AnimatedBoxContainer({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);
  // static final _opacityTween = Tween<double>(begin: 0.3, end: 1);
  static final _sizeTween = Tween<double>(begin: 1, end: 10);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.scale(
      scale: _sizeTween.evaluate(animation),
      child:
          // Opacity(
          // opacity: _opacityTween.evaluate(animation),
          // child:
          Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        height: 100,
        width: 100,
      ),
      // ),
    );
  }
}

class AnimatedTweenBoxContainer extends AnimatedWidget {
  const AnimatedTweenBoxContainer({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);
  // static final _opacityTween = Tween<double>(begin: 0.3, end: 1);
  // static final _sizeTween = Tween<double>(begin: 1, end: 10);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.scale(
      scale: 1 + animation.value,
      child:
          // Opacity(
          // opacity: _opacityTween.evaluate(animation),
          // child:
          Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        height: 100,
        width: 100,
      ),
      // ),
    );
  }
}

class AnimatedTweenContainer extends StatelessWidget {
  const AnimatedTweenContainer({
    super.key,
    required this.animation,
  });
  final Animation<double> animation;
  // static final _opacityTween = Tween<double>(begin: 0.3, end: 1);
  // static final _sizeTween = Tween<double>(begin: 1, end: 10);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          log("animation.value.toString()");
          return Transform.scale(
            scale: 1 + animation.value,
            child:
                // Opacity(
                // opacity: _opacityTween.evaluate(animation),
                // child:
                Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              height: 100,
              width: 100,
            ),
            // ),
          );
        });
  }
}
