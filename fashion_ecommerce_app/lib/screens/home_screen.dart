import 'package:animate_do/animate_do.dart';
import 'package:fashion_ecommerce_app/data/app_data.dart';
import 'package:fashion_ecommerce_app/models/base_model.dart';
import 'package:fashion_ecommerce_app/models/categories_model.dart';
import 'package:fashion_ecommerce_app/utils/global_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header Text
              FadeInUp(
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Find your ",
                            style: theme.headlineLarge,
                            children: [
                              TextSpan(
                                  text: "Style",
                                  style: theme.headlineLarge?.copyWith(
                                    color: primaryColor,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ]),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: "Be more beautiful with our ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                  text: "Suggesstions",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),

              // Categories
              FadeInUp(
                duration: const Duration(milliseconds: 450),
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: size.width,
                  height: size.height * 0.14,
                  child: ListView.builder(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        CategoriesModel category = categories[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(category.imageUrl),
                              ),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              Text(
                                category.title,
                                style: theme.displayMedium,
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),

              // Body
              FadeInUp(
                duration: const Duration(milliseconds: 550),
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: size.width,
                  height: size.height * 0.45,
                  child: PageView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: mainList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: view(index, theme, size),
                      );
                      // BaseModel baseModel = mainList[index];
                      // return CardWidget(
                      //     size: size, baseModel: baseModel, theme: theme);
                    },
                  ),
                ),
              ),

              // Most Popular Text
              FadeInUp(
                delay: const Duration(microseconds: 650),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most Popular",
                        style: theme.headlineSmall,
                      ),
                      Text(
                        "See all",
                        style: theme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ),

              // Most Popular Content
              FadeInUp(
                delay: const Duration(milliseconds: 750),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.44,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: mainList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.63, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      BaseModel baseModel = mainList[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              width: size.width * 0.5,
                              height: size.height * 0.28,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: DecorationImage(
                                      image: AssetImage(baseModel.imageUrl),
                                      fit: BoxFit.cover),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      color: Color.fromARGB(61, 0, 0, 0),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                baseModel.name,
                                style: theme.headlineSmall,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "\$ ",
                                  style: theme.headlineMedium?.copyWith(
                                    color: primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: baseModel.price.toString(),
                                        style: theme.headlineMedium?.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 0.0;
        if (_controller.position.haveDimensions) {
          value = index.toDouble() - (_controller.page ?? 0);
          value = (value * 0.04).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: 3.14 * value,
          child:
              CardWidget(size: size, baseModel: mainList[index], theme: theme),
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.size,
    required this.baseModel,
    required this.theme,
  });

  final Size size;
  final BaseModel baseModel;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            width: size.width * 0.6,
            height: size.height * 0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.orange,
                image: DecorationImage(
                    image: AssetImage(baseModel.imageUrl), fit: BoxFit.cover),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromARGB(61, 0, 0, 0),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              baseModel.name,
              style: theme.headlineLarge?.copyWith(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
                text: "\$ ",
                style: theme.headlineMedium?.copyWith(
                  color: primaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: baseModel.price.toString(),
                      style: theme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ))
                ]),
          ),
        ],
      ),
    );
  }
}
