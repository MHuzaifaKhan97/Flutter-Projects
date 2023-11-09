import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:fashion_ecommerce_app/data/app_data.dart';
import 'package:fashion_ecommerce_app/models/base_model.dart';
import 'package:fashion_ecommerce_app/utils/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    itemsOnSearch = mainList;
  }

  onSearch(String sarchValue) {
    itemsOnSearch = mainList
        .where((element) => element.name
            .toLowerCase()
            .contains(sarchValue.toLowerCase().trim()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                //  Search TextField
                FadeInUp(
                  delay: const Duration(milliseconds: 50),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.07,
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) => onSearch(value),
                        decoration: InputDecoration(
                            hintStyle: theme.headlineSmall?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                            hintText: 'e.g. Casual Jeans',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _controller.clear();
                                    itemsOnSearch = mainList;
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  });
                                },
                                icon: const Icon(Icons.close))),
                        style: theme.headlineSmall?.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                //
                SizedBox(height: size.height * 0.01),
                Expanded(
                    child: FadeInUp(
                  delay: const Duration(milliseconds: 750),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.44,
                    child: itemsOnSearch.isNotEmpty
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: itemsOnSearch.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.63, crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              BaseModel baseModel = itemsOnSearch[index];
                              return GestureDetector(
                                onTap: () {},
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      top: size.width * 0.02,
                                      left: size.width * 0.01,
                                      right: size.width * 0.01,
                                      child: Container(
                                        width: size.width * 0.5,
                                        height: size.height * 0.27,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    baseModel.imageUrl),
                                                fit: BoxFit.cover),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                                color:
                                                    Color.fromARGB(61, 0, 0, 0),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: size.height * 0.04,
                                      child: Text(
                                        baseModel.name,
                                        style: theme.headlineSmall,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: size.height * 0.01,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "\$ ",
                                            style:
                                                theme.headlineMedium?.copyWith(
                                              color: primaryColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: baseModel.price
                                                      .toString(),
                                                  style: theme.headlineMedium
                                                      ?.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ))
                                            ]),
                                      ),
                                    ),
                                    Positioned(
                                      top: size.height * 0.01,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: primaryColor,
                                        child: IconButton(
                                            onPressed: () {
                                              print(
                                                  "${baseModel.name} Added to cart");
                                            },
                                            icon: const Icon(
                                              LineIcons.addToShoppingCart,
                                              color: Colors.white,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeInUp(
                                delay: const Duration(milliseconds: 200),
                                child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/search_fail.png'),
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              FadeInUp(
                                  delay: const Duration(milliseconds: 250),
                                  child: const Text(
                                    "No Result found :(",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ))
                            ],
                          ),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
