import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Need Ball
            AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return CustomPaint(
                    size: const Size(200, 200),
                    painter: BouningBallPainter(
                      animation.value,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class BouningBallPainter extends CustomPainter {
  final double animationValue;
  BouningBallPainter(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width / 2, size.height - (size.height * animationValue)),
        20,
        Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
