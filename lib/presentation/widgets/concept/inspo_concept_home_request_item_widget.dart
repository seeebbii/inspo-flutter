import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../../notifiers/bottomNavBar.notifier.dart';
import '../inspo_button.dart';

class InspoConceptHomeRequestItemWidget extends StatelessWidget {
  const InspoConceptHomeRequestItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);

    return Consumer<ConceptHomeScreenNotifier>(
        builder: (context, model, builder) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/avtar.png"),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ISLAM MANSOORI",
                        style: Dimensions.customTextStyle(
                          21,
                          FontWeight.w600,
                          Colors.black,
                        ),
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
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "WANTS TO COVER YOUR CONCEPT",
                style: Dimensions.customTextStyle(
                  16,
                  FontWeight.w400,
                  AppTheme.blackColor,
                ),
              ),
              const SizedBox(height: 15),
              model.isRequestAccepted
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InspoButton(
                          text: "ACCEPT",
                          height: 50,
                          marginTop: 5,
                          buttonColor: AppTheme.lightGreen,
                          buttonRadius: 7,
                          fontSize: 12,
                          marginBottom: 23,
                          fontWeight: FontWeight.w700,
                          borderWidth: 1,
                          textColor: Colors.black,
                          onPressed: () {
                            provider.selectIndex(6);
                          },
                        ),
                      ],
                    )
                  : model.isRequestDenied
                      ? Expanded(
                          child: InspoButton(
                            text: "DENY",
                            height: 50,
                            marginTop: 5,
                            buttonColor: AppTheme.redButton,
                            buttonRadius: 7,
                            fontSize: 12,
                            marginBottom: 23,
                            fontWeight: FontWeight.w700,
                            borderWidth: 1,
                            textColor: Colors.black,
                            onPressed: () {},
                          ),
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: InspoButton(
                                text: "ACCEPT",
                                width: 146,
                                height: 50,
                                marginTop: 5,
                                buttonColor: AppTheme.lightGreen,
                                buttonRadius: 3,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                borderWidth: 1,
                                textColor: Colors.black,
                                onPressed: () {
                                  model.setRequestAccepted(true);
                                },
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: InspoButton(
                                text: "DENY",
                                width: 146,
                                height: 50,
                                marginTop: 5,
                                buttonColor: AppTheme.redButton,
                                buttonRadius: 3,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                borderWidth: 1,
                                textColor: Colors.black,
                                onPressed: () {
                                  model.setRequestDenied(true);
                                },
                              ),
                            )
                          ],
                        )
            ],
          ),
        ),
      );
    });
  }
}
