import 'package:flutter/material.dart';

import '../../widgets/inspo_app_bar.dart';
import '../../widgets/inspo_button.dart';

class ApplicationUnderReviewScreen extends StatelessWidget {
  const ApplicationUnderReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InspoAppBar(),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 31),
                      child: Text(
                        "THANK YOU!!!",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 250),
                      child: Text(
                        "YOUR APPLICATION IS BEING REVIEWED",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(
                        "PLEASE CHECK BACK IN 1 HOUR",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500
                        ),
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
