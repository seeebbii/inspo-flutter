import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../../widgets/inspo_button.dart';

class InspoConfirmationDialog extends StatefulWidget {
  InspoConfirmationDialog({super.key,required this.onYesButtonTap});
  VoidCallback onYesButtonTap;

  @override
  State<InspoConfirmationDialog> createState() =>
      _InspoConfirmationDialogState();
}

class _InspoConfirmationDialogState extends State<InspoConfirmationDialog> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(color: Colors.black, width: 4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.5, vertical: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                              const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.arrow_forward_ios, size: 15),
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
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                      text: 'GOODCUP HAS ',
                      style: Dimensions.customTextStyle(
                        16,
                        FontWeight.w500,
                        AppTheme.blackColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'ACCEPTED YOUR REQUEST ',
                          style: Dimensions.customTextStyle(
                            16,
                            FontWeight.w700,
                            AppTheme.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'SEE YOU @ 6:00 ',
                          style: Dimensions.customTextStyle(
                            16,
                            FontWeight.w500,
                            AppTheme.blackColor,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 20),
                Text(
                  "REQUIREMENTS",
                  style: Dimensions.customTextStyle(
                    16,
                    FontWeight.w400,
                    AppTheme.blackColor,
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 57),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppTheme.blackColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "4 STORYS\n2POSTS\nDISCRETE MARKETING",
                      style: Dimensions.customTextStyle(
                        16,
                        FontWeight.w700,
                        AppTheme.blackColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DESCRIPTION",
                      style: Dimensions.customTextStyle(
                        16,
                        FontWeight.w400,
                        AppTheme.blackColor,
                      ),
                    ),
                    Text(
                      "0/400 character",
                      style: Dimensions.customTextStyle(
                        8,
                        FontWeight.w400,
                        AppTheme.blackColor,
                      ),
                    ),
                  ],
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 57),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 5),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppTheme.blackColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "HEADS UP WE ARE A COOL CONCEPT",
                      style: Dimensions.customTextStyle(
                        16,
                        FontWeight.w700,
                        AppTheme.blackColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "LOCATION",
                  style: Dimensions.customTextStyle(
                    16,
                    FontWeight.w400,
                    AppTheme.blackColor,
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 57),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppTheme.blackColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "GOODCUP",
                      style: Dimensions.customTextStyle(
                        16,
                        FontWeight.w700,
                        AppTheme.blackColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "TIMING",
                  style: Dimensions.customTextStyle(
                    16,
                    FontWeight.w400,
                    AppTheme.blackColor,
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 57),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppTheme.blackColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "JAN 29 @ 6:00 PM",
                      style: Dimensions.customTextStyle(
                        16,
                        FontWeight.w700,
                        AppTheme.blackColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "BOOSTER",
                  style: Dimensions.customTextStyle(
                    16,
                    FontWeight.w400,
                    AppTheme.blackColor,
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 57),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 5),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: AppTheme.blackColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "20KD",
                      style: Dimensions.customTextStyle(
                        16,
                        FontWeight.w700,
                        AppTheme.blackColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: InspoButton(
                        text: "YES:)",
                        width: 119,
                        height: 47,
                        buttonColor:
                            _selectedIndex == 0 ? Colors.black : Colors.white,
                        buttonRadius: 7,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        textColor:
                            _selectedIndex == 0 ? Colors.white : Colors.black,
                        borderWidth: 2,
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: InspoButton(
                        text: "NOPE:/",
                        width: 119,
                        height: 47,
                        buttonColor:
                            _selectedIndex == 1 ? Colors.black : Colors.white,
                        buttonRadius: 7,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        textColor:
                            _selectedIndex == 1 ? Colors.white : Colors.black,
                        borderWidth: 2,
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: _selectedIndex == 0,
                  child: Center(
                    child: Column(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Text(
                            'Are you sure? You have another coverage @ 6:00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InspoButton(
                          text: "I GOT IT",
                          width: 159,
                          height: 48,
                          buttonColor: Colors.black,
                          buttonRadius: 7,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.white,
                          borderWidth: 2,
                          onPressed: () {
                            GoRouter.of(context).pop();
                            widget.onYesButtonTap();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
