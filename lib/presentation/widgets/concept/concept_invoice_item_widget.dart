import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';
import '../inspo_review_circle.dart';

class ConceptInvoiceItemWidget extends StatelessWidget {
  VoidCallback onTap;
  ConceptInvoiceItemWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/avtar.png"),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: AutoSizeText(
                                  maxLines: 1,
                                  "ISLAM MANSOORI",
                                  style: Dimensions.customTextStyle(
                                    21,
                                    FontWeight.w600,
                                    Colors.black,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child:
                                    Icon(Icons.arrow_forward_ios, size: 12.5),
                              ),
                              Text(
                                "DETAILS",
                                style: Dimensions.customTextStyle(
                                  9,
                                  FontWeight.w600,
                                  AppTheme.blackColor,
                                ),
                              ),
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
                    ],
                  ),
                  Text(
                    "\$",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8)
      ],
    );
  }
}
