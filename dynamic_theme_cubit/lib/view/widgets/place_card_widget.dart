import 'package:dynamic_theme_cubit/data/model/place.dart';
import 'package:dynamic_theme_cubit/view/widgets/media_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PlaceCardView extends StatelessWidget {
  final Place place;
  final void Function()? press;

  const PlaceCardView({Key? key, required this.place, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(right: 25, left: 25, top: 25),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(4, 8)),
            ],
          ),
          child: Column(
            children: [
              MediaCardView(image: place.image, press: press),
              const SizedBox(height: 5),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  place.title!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .color,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  place.price!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .color),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              place.description!,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: place.rating!,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 4,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${place.reviewCount!} reviews",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .color,
                                ),
                                label: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .color),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    side: BorderSide(
                                        width: 1,
                                        color: Theme.of(context).hintColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      10,
                                    ))))
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
