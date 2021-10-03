import 'package:flutter/material.dart';

import 'Widgets/BottomSheetTransition.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5dcae8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 400,
                  width: 400,
                  // color: Colors.white.withOpacity(0.3),
                  child: Center(
                    child: Text(
                      'Bottom Sheet Animation',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(
                  //       'assets/wegz.jpg',
                  //     ),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ),
              ],
            ),
            BottomSheetTransition(),
          ],
        ),
      ),
    );
  }
}
