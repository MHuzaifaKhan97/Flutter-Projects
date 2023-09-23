import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    scaleAnimation = Tween<double>(begin: 1.0, end: 10.0).animate(controller);

    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.push(
          context,
          MyCustomRouteTransition(route: const Destination()),
        );
        // controller.addListener(() {
        //   if (controller.isCompleted) {
        //     Navigator.push(
        //       context,
        //       PageRouteBuilder(
        //         pageBuilder: (_, animation, secondaryAnimation) =>
        //             const Destination(),
        //         transitionsBuilder:
        //             (context, animation, secondaryAnimation, child) {
        //           final tween = Tween(begin: const Offset(0, -1), end: Offset.zero)
        //               .animate(
        //                   CurvedAnimation(parent: animation, curve: Curves.easeIn));
        //           // return FadeTransition(opacity: animation, child: child);
        //           return SlideTransition(position: tween, child: child);
        //         },
        //       ),
        //     );

        Timer(const Duration(milliseconds: 500), () {
          controller.reset();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: GestureDetector(
            onTap: () {
              controller.forward();
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
      body: const Center(child: Text("Hello World")),
    );
  }
}

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route})
      : super(
          pageBuilder: (_, animation, secondaryAnimation) => route,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(0, -1), end: Offset.zero)
                .animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeIn));
            // return FadeTransition(opacity: animation, child: child);
            return SlideTransition(position: tween, child: child);
          },
        );
}
