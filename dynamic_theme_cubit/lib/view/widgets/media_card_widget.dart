import 'package:flutter/material.dart';

class MediaCardView extends StatefulWidget {
  final String? image;
  final Function? press;

  const MediaCardView({Key? key, this.image, this.press}) : super(key: key);

  @override
  MediaCardViewState createState() => MediaCardViewState();
}

class MediaCardViewState extends State<MediaCardView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          // Use here borderRadius
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: Material(
            // Use here Material widget
            child: Ink.image(
              image: NetworkImage(widget.image!),
              height: size.height * 0.40,
              fit: BoxFit.cover,
              child: InkWell(onTap: () {}),
            ),
          ),
        ),
        Positioned(
            top: 15,
            right: 15,
            child: Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.edit_square,
                      color: Colors.white,
                    )
                  ],
                )))
      ],
    );
  }
}
