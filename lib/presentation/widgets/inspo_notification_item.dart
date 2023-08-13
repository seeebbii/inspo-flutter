import 'dart:math';

import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:flutter/material.dart';

import '../../config/app_theme.dart';
import '../../utils/dimensions.dart';

class InspoNotificationItem extends StatelessWidget {
  const InspoNotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomNumber = random.nextInt(2);
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  width: 28,
                  height: 28,
                  child: Image.asset("assets/images/avtar.png")),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "GOOD CUP",
                          style: Dimensions.customTextStyle(
                            21,
                            FontWeight.w600,
                            Colors.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.arrow_forward_ios, size: 15),
                        const SizedBox(width: 5),
                        Text(
                          "Requirements",
                          style: Dimensions.customTextStyle(
                            11,
                            FontWeight.w600,
                            Colors.black,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "10hr",
                      style: Dimensions.customTextStyle(
                        12,
                        FontWeight.w400,
                        AppTheme.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "GOODCUP HAS ACCEPTED YOUR REQUEST SEE YOU @ 6:00 ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 15),
          randomNumber > 0.5
              ? Row(
                  children: [
                    Expanded(
                      child: InspoButton(
                        text: "COVERED",
                        height: 63,
                        buttonColor: Colors.black,
                        buttonRadius: 9,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.white,
                        borderWidth: 2,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: InspoButton(
                        text: "NOPE",
                        height: 63,
                        marginRight: 12,
                        buttonColor: Colors.white,
                        buttonRadius: 9,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.black,
                        borderWidth: 2,
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
