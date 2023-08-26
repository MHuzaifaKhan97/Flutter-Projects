import 'package:flutter/material.dart';
import 'package:mobileapp/resources/app_theme.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber,
          color: AppTheme.primaryColor,
          size: 32,
        ),
        Text(
          "No Data",
          style: TextStyle(color: AppTheme.primaryColor, fontSize: 16),
        )
      ],
    );
  }
}
