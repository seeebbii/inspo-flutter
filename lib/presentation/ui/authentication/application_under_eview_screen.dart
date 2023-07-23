import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';
import '../../widgets/inspo_app_bar.dart';

class ApplicationUnderReviewScreen extends StatelessWidget {
  const ApplicationUnderReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InspoAppBar(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: context.height * 0.05),
                    Text(
                      "THANK YOU!!!",
                      style: Dimensions.customTextStyle(
                        32,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: context.height * 0.25),
                    Text(
                      "YOUR APPLICATION IS BEING REVIEWED",
                      style: Dimensions.customTextStyle(
                        13,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                    Text(
                      "PLEASE CHECK BACK IN 1 HOUR",
                      style: Dimensions.customTextStyle(
                        13,
                        FontWeight.w500,
                        Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
