import 'package:clean_architecture_template/config/app_theme.dart';
import 'package:flutter/material.dart';

class AppCircularIndicatorWidget extends StatelessWidget {
  const AppCircularIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppTheme.primaryColor,
      ),
    );
  }
}
