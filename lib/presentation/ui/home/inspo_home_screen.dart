import 'package:flutter/material.dart';

import '../../widgets/inspo_home_food_item.dart';
import 'inspo_confirmation_dialog.dart';

class InspoHomeScreen extends StatefulWidget {
  const InspoHomeScreen({Key? key}) : super(key: key);

  @override
  State<InspoHomeScreen> createState() => _InspoHomeScreenState();
}

class _InspoHomeScreenState extends State<InspoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            // Wrap ListView.builder with Expanded
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return InspoHomeFoodItem(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return InspoConfirmationDialog(); // Your custom dialog widget
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
