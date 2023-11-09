import 'package:fashion_ecommerce_app/screens/home_screen.dart';
import 'package:fashion_ecommerce_app/utils/app_theme.dart';
import 'package:fashion_ecommerce_app/widgets/main_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion E-Commerce App UI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const MainWrapper(),
    );
  }
}
