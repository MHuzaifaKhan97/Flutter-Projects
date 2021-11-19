import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnakeNavigationBar Example ',
      debugShowCheckedModeBanner: false,
      home: SnakeNavigationBarExampleScreen(),
    );
  }
}

class SnakeNavigationBarExampleScreen extends StatefulWidget {
  @override
  _SnakeNavigationBarExampleScreenState createState() =>
      _SnakeNavigationBarExampleScreenState();
}

class _SnakeNavigationBarExampleScreenState
    extends State<SnakeNavigationBarExampleScreen> {
  final BorderRadius _borderRadius = const BorderRadius.only(
      // topLeft: Radius.circular(25),
      // topRight: Radius.circular(25),
      );

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.rectangle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;
  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);

  Color unselectedColor = Colors.blueGrey;
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
  ];

  @override
  Widget build(BuildContext context) {
    var CustomIcons;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        brightness: Brightness.light,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {}),
        title: const Text('Go back', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'tickets',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'calendar'),
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }

  void _onPageChanged(int page) {
    containerColor = containerColors[page];
    switch (page) {
      case 0:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.floating;
          snakeShape = SnakeShape.circle;
          padding = const EdgeInsets.all(12);
          bottomBarShape =
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25));
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;
      case 1:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.circle;
          padding = EdgeInsets.zero;
          bottomBarShape = RoundedRectangleBorder(borderRadius: _borderRadius);
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;

      case 2:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.rectangle;
          padding = EdgeInsets.zero;
          bottomBarShape = BeveledRectangleBorder(borderRadius: _borderRadius);
          showSelectedLabels = true;
          showUnselectedLabels = true;
        });
        break;
      case 3:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.indicator;
          padding = EdgeInsets.zero;
          bottomBarShape = null;
          showSelectedLabels = false;
          showUnselectedLabels = false;
        });
        break;
    }
  }
}

class PagerPageWidget extends StatelessWidget {
  final String? text;
  final String? description;
  final Image? image;
  final TextStyle titleStyle =
      const TextStyle(fontSize: 40, fontFamily: 'SourceSerifPro');
  final TextStyle subtitleStyle = const TextStyle(
    fontSize: 20,
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w200,
  );

  const PagerPageWidget({
    Key? key,
    this.text,
    this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _portraitWidget()
              : _horizontalWidget(context);
        }),
      ),
    );
  }

  Widget _portraitWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(text!, style: titleStyle),
            const SizedBox(height: 16),
            Text(description!, style: subtitleStyle),
          ],
        ),
        image ?? Container()
      ],
    );
  }

  Widget _horizontalWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(text!, style: titleStyle),
              Text(description!, style: subtitleStyle),
            ],
          ),
        ),
        Expanded(child: image!)
      ],
    );
  }
}

class ClipperStack extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // print(size.height);
    // print(size.width);

    path.moveTo(0.0, 10.0);
    path.lineTo((size.width / 2) - 10, 10.0);
    path.lineTo((size.width / 2) - 10, 10);
    path.lineTo(size.width / 2, 0.0);
    path.lineTo((size.width / 2) + 10, 10);
    path.lineTo(size.width, 10);
    path.lineTo(size.width, size.height - 10);
    path.lineTo(0.0, size.height - 10);
//     path.lineTo(0.0, size.height-10);
//     path.lineTo((size.width / 2 )-10, size.height-10);
//     path.lineTo(size.width / 2, size.height);
//     path.lineTo((size.width / 2)+10, size.height-10);
//     path.lineTo(size.width, size.height-10);
//     path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
