import 'package:clean_architecture_template/config/app_theme.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/dimensions.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/concept/concept_invoice_item_widget.dart';
import '../../widgets/concept/inspo_concept_view_all_review_item_widget.dart';
import '../../widgets/inspo_button.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  InvoiceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _transactionStatus = "COMPLETED";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "INVOICE",
          style: Dimensions.customTextStyle(
            16,
            FontWeight.w600,
            Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.5, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.arrow_back_sharp, size: 20),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.only(topRight: Radius.circular(19),topLeft: Radius.circular(19)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12),
                    Center(child: SvgPicture.asset("assets/icons/arrow_down.svg")),
                    SizedBox(height: 4),
                    Text(
                      "BOOSTER PAYMENT",
                      style: Dimensions.customTextStyle(
                        13,
                        FontWeight.w600,
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "KWD 20",
                      style: Dimensions.customTextStyle(
                        32,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "27.09.2022, 12:12",
                      style: Dimensions.customTextStyle(
                        13,
                        FontWeight.w500,
                        AppTheme.textLightGray,
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: _transactionStatus == "COMPLETED" ?
                        AppTheme.lightGreen : _transactionStatus == "CANCELED" ?
                        AppTheme.transactionRed : _transactionStatus == "PENDING" ?
                        AppTheme.transactionLight : AppTheme.lightGreen
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14,horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Transaction Status",
                              style: Dimensions.customTextStyle(
                                15,
                                FontWeight.w400,
                                  _transactionStatus == "COMPLETED" ?
                                  AppTheme.black : _transactionStatus == "CANCELED" ?
                                  AppTheme.whiteColor : _transactionStatus == "PENDING" ?
                                  AppTheme.transactionLightText : AppTheme.black
                              ),
                            ),
                            Text(
                              "Completed!",
                              style: Dimensions.customTextStyle(
                                15,
                                FontWeight.w500,
                                _transactionStatus == "COMPLETED" ?
                                AppTheme.lightThemeGreenText : _transactionStatus == "CANCELED" ?
                                AppTheme.whiteColor : _transactionStatus == "PENDING" ?
                                AppTheme.transactionLightText : AppTheme.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           SvgPicture.asset("assets/icons/ic_download.svg"),
                            SizedBox(width: 4),
                            Text(
                              "EMAIL RECEIPT",
                              style: Dimensions.customTextStyle(
                                15,
                                FontWeight.w400,
                                Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Transaction Details",
                      style: Dimensions.customTextStyle(
                        17,
                        FontWeight.w600,
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(width: 2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Transaction ID",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "324837548",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Type of transaction",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "Payment",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sending Currency",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "Kuwaiti dinars",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Inspo service fee",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "KD 0.500 ",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 13),
                            Center(
                              child: Text(
                                "INSPO TRANSACTION RATE",
                                style: Dimensions.customTextStyle(
                                  15,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Transaction Rate",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "20 - 10% = KD 19",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 13),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Inspo booster Fee",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "KD 1",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Sender Details",
                      style: Dimensions.customTextStyle(
                        17,
                        FontWeight.w600,
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(width: 2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sender Account",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "PN04578280776",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sender Name",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "GOODCUP",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sended Amount",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "KD 20",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Recipient Details",
                      style: Dimensions.customTextStyle(
                        17,
                        FontWeight.w600,
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(width: 2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recipient Account",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "PN04578280776",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sender Name",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "ISLAM MANSORI",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Received Amount",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "KD 20",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w400,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
