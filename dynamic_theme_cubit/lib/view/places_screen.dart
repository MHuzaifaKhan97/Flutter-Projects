import 'package:dynamic_theme_cubit/core/constants/app_constants.dart';
import 'package:dynamic_theme_cubit/core/constants/colors.dart';
import 'package:dynamic_theme_cubit/data/logic/theme/theme_cubit.dart';
import 'package:dynamic_theme_cubit/data/model/place.dart';
import 'package:dynamic_theme_cubit/data/services/app_preferences.dart';
import 'package:dynamic_theme_cubit/data/services/service_locator.dart';
import 'package:dynamic_theme_cubit/view/widgets/place_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final places = [
  Place(
      title: "London Tour",
      description: "4N/5D",
      price: "\$150.00",
      rating: 4,
      reviewCount: 40,
      image:
          "https://media.istockphoto.com/id/1365147272/es/foto/puente-octavio-frias-de-oliveira-en-sao-paulo-brasil-am%C3%A9rica-latina.jpg?s=612x612&w=0&k=20&c=fo2cesqIkiVtNbPkxeekDknvaNeLODxgLvcWbtNnk-I="),
  Place(
      title: "Exclusive Dublin tour",
      description: "3N/4D",
      price: "\$110.00",
      rating: 4,
      reviewCount: 56,
      image:
          "https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z2VybWFueXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
  Place(
      title: "Madrid city tour",
      description: "4N/4D",
      price: "\$140.00",
      rating: 4,
      reviewCount: 38,
      image:
          "https://images.unsplash.com/photo-1616231339921-abd6c61276e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fG1hZHJpZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
];

class PlacesScreen extends StatefulWidget {
  static const String routeName = "/places";

  const PlacesScreen({Key? key}) : super(key: key);

  @override
  PlacesScreenState createState() => PlacesScreenState();
}

class PlacesScreenState extends State<PlacesScreen> {
  bool isDark = false;

  void _changeTheme() {
    BlocProvider.of<ThemeCubit>(context).changeTheme(isDark);
  }

  @override
  void initState() {
    isDark = getIt<AppPrefrences>().isDark();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            leadingWidth: 40,
            title: Row(
              children: [
                Text(
                  AppConstants.lightModeTitle,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleSmall!.color,
                      fontWeight:
                          (isDark) ? FontWeight.normal : FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "·",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleSmall!.color,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  AppConstants.darkModeTitle,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleSmall!.color,
                      fontWeight:
                          (isDark) ? FontWeight.bold : FontWeight.normal),
                )
              ],
            ),
            actions: [
              Switch(
                value: isDark,
                inactiveTrackColor: black,
                activeColor: white,
                inactiveThumbColor: (isDark) ? black : white,
                onChanged: (value) {
                  setState(() {
                    isDark = !isDark;
                  });
                  _changeTheme();
                },
              )
            ]),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: places.length,
                      itemBuilder: (context, index) => PlaceCardView(
                        place: places[index],
                        press: () {},
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
