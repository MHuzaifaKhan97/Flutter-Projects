import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isAnimationExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAnimationExpanded = !isAnimationExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            width: isAnimationExpanded ? 160.0 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isAnimationExpanded ? Colors.green : Colors.blue,
              borderRadius:
                  BorderRadius.circular(isAnimationExpanded ? 40.0 : 10.0),
            ),
            child: isAnimationExpanded
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Added to Cart",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                : const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
