import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late List<Animation<Offset>> animations = [];
  final int itemsCount = 15;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animations = List.generate(
        itemsCount,
        (index) => Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(index * (1 / itemsCount), 1))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: itemsCount,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: animations[index],
            child: ListTile(
              title: Text('Hello World from Huzaifa Khan. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationController.isCompleted) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
