import 'package:clean_architecture_template/config/app_theme.dart';
import 'package:clean_architecture_template/presentation/notifiers/ibanScreenPageView.notifier.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../utils/dimensions.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/concept/concept_invoice_item_widget.dart';
import '../../widgets/concept/inspo_concept_view_all_review_item_widget.dart';
import '../../widgets/inspo_button.dart';

class IBANInfoScreen extends StatelessWidget {
   IBANInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.only(topRight: Radius.circular(31),topLeft: Radius.circular(31)),
        ),
        child: Consumer<IBANPageViewProvider>(
          builder: (context, model, builder){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: model.pageController,
                      onPageChanged: (index) {
                        model.selectIndex(index);
                      },
                      children:  [
                        ...IBANInfoWidgetFirst(),
                        ...IBANInfoWidgetSecond(),
                        ...IBANInfoWidgetThird(),
                      ],
                    )
                  ),
                  Container(
                    height: 10,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: model.selectedIndex == index ? AppTheme.black : AppTheme.darkDividerColor, // Use your own selected and unselected colors
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  InspoButton(
                    text: "GOT IT!!!",
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    buttonColor: AppTheme.blackColor,
                    buttonRadius: 8,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.white,
                    borderWidth: 1,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 32)
                ],
              ),
            );
          },
        )
      ),
    );
  }
}

List<Widget> IBANInfoWidgetFirst(){
  return [
  Column(
      children: [
        Expanded(child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36),
                  Center(
                    child: Text(
                      "TO FIND YOUR IBAN, YOU CAN FOLLOW THESE STEPS:",
                      style: Dimensions.customTextStyle(
                        23.9,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "INTERNET BANKING",
                    style: Dimensions.customTextStyle(
                      23,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  SizedBox(width: 3),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1)
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: Dimensions.customTextStyle(
                          9,
                          FontWeight.w500,
                          Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                "LOG IN TO YOUR ONLINE BANKING ACCOUNT AND LOOK FOR ACCOUNT DETAILS  OR PROFILE SETTINGS, THE IBAN IS OFTEN DISPLAYED THERE",
                style: Dimensions.customTextStyle(
                  16,
                  FontWeight.w500,
                  Colors.black,
                ),
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CHECK BANK STATEMENTS",
                    style: Dimensions.customTextStyle(
                      23,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  SizedBox(width: 3),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1)
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: Dimensions.customTextStyle(
                          9,
                          FontWeight.w500,
                          Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                "MOST BANKS INCLUDE THE IBAN ON ACCOUNT STATEMENTS",
                style: Dimensions.customTextStyle(
                  16,
                  FontWeight.w500,
                  Colors.black,
                ),
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CONTACT YOUR BANK",
                    style: Dimensions.customTextStyle(
                      23,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  SizedBox(width: 3),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1)
                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: Dimensions.customTextStyle(
                          9,
                          FontWeight.w500,
                          Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                "IF YOU CAN'T FIND YOUR IBAN THROUGH THE ABOVE METHODS, YOU CAN CONTACT YOUR BANK’S CUSTOMER SUPPORT. THEY WILL HELP AS YOU NEED IN PROVIDING YOUR IBAN.",
                style: Dimensions.customTextStyle(
                  16,
                  FontWeight.w500,
                  Colors.black,
                ),
              ),
              const SizedBox(height: 26),
            ],
        )
        )
      ],
  )
  ];
}

List<Widget> IBANInfoWidgetSecond(){
  return [
    Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 85),
            Center(
              child: Text(
                "IBAN EXAMPLE IN KUWAIT",
                style: Dimensions.customTextStyle(
                  27,
                  FontWeight.w700,
                  Colors.black,
                ),
              ),
            ),
          ],
        ),
        Text(
          "KW81 CBKU 0000  0000 0000 1234 5601",
          style: Dimensions.customTextStyle(
            19,
            FontWeight.w700,
            Colors.black,
          ),
        ),
            Text(
              "An IBAN (INTERNATIONAL BANK ACCOUNT NUMBER) is an internationally agreed code made up of up to 34 letters and numbers that helps banks make sure that international transfers are processed correctly.",
              textAlign: TextAlign.center,
              style: Dimensions.customTextStyle(
                7.27,
                FontWeight.w600,
                Colors.black,
              ),
            ),
            SizedBox()
      ],
    )
    )
  ];
}


List<Widget> IBANInfoWidgetThird(){
  return [
    Column(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 83),
                Center(
                  child: Text(
                    "IBAN IS NOT THE SAME AS CARD NUMBER",
                    textAlign: TextAlign.center,
                    style: Dimensions.customTextStyle(
                      27.9,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 74),
            Text(
              "A CREDIT CARD NUMBER OR DEBIT CARD, iS A SPECFIC TO YOUR PAYMENT CARD IS USED FOR MAKING CARD TRANSCATIONS",
              style: Dimensions.customTextStyle(
                16,
                FontWeight.w500,
                Colors.black,
              ),
            ),
            const SizedBox(height: 19),
            Text(
              "ON THE OTHER HAND, IBAN IS USED FOR IDENTIFYING BANK ACCOUNTS FOR INTERNATIONAL TRANSFERS.",
              style: Dimensions.customTextStyle(
                16,
                FontWeight.w500,
                Colors.black,
              ),
            ),
            const SizedBox(height: 19),
            Text(
              "PLEASE ENTER THE DATA CAREFULLY, OTHERWISE WE CAN'T TRANSFER THE FUNDS.",
              style: Dimensions.customTextStyle(
                16,
                FontWeight.w500,
                Colors.black,
              ),
            ),
            const SizedBox(height: 19),
            Text(
              "HAPPY COVERING AND INFLUENCING <3",
              textAlign: TextAlign.start,
              style: Dimensions.customTextStyle(
                16,
                FontWeight.w500,
                Colors.black,
              ),
            ),
          ],
        )
        )
      ],
    )
  ];
}

