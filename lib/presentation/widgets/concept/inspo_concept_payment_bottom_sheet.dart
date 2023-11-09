import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../../notifiers/conceptHomeMainScreen.notifier.dart';
import '../app_simple_text_field.dart';
import '../inspo_button.dart';

class InspoConceptPaymentBottomSheet extends StatefulWidget {
  const InspoConceptPaymentBottomSheet({super.key});

  @override
  State<InspoConceptPaymentBottomSheet> createState() =>
      _InspoConceptPaymentBottomSheetState();
}

class _InspoConceptPaymentBottomSheetState
    extends State<InspoConceptPaymentBottomSheet> {
  bool animate = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        animate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final conceptHomeMainScreenProvider =
        Provider.of<ConceptHomeMainScreenProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeInOutBack,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          margin: EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            top: animate ? size.height / 10 : size.height,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(11), topRight: Radius.circular(11)),
              border: Border.all(width: 2.29)),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/swap.svg"),
                  const SizedBox(width: 10.0),
                  const Text("ISLAM MANSORI",
                      style: TextStyle(
                          fontFamily: "assets/fonts/Halvetica.ttf",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black)),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      conceptHomeMainScreenProvider.setDialogVisible(false);
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                maxLines: 1,
                "BOOSTER PAYMENT",
                style: Dimensions.customTextStyle(
                  24,
                  FontWeight.w400,
                  Colors.black,
                ),
              ),
              AutoSizeText(
                maxLines: 1,
                "KWD 20",
                style: Dimensions.customTextStyle(
                  64,
                  FontWeight.w700,
                  Colors.black,
                ),
              ),
              // const Divider(
              //   color: AppTheme.fieldOutlineColor,
              //   thickness: 1.25,
              //   height: 0,
              // ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaction",
                        style: Dimensions.customTextStyle(
                          17,
                          FontWeight.w400,
                          Colors.black,
                        ),
                      ),
                      Text(
                        "10% - BOOSTER",
                        style: Dimensions.customTextStyle(
                          17,
                          FontWeight.w400,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "DATE 00, TIME",
                      style: Dimensions.customTextStyle(
                        13,
                        FontWeight.w400,
                        Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Inspo booster Fees",
                        style: Dimensions.customTextStyle(
                          17,
                          FontWeight.w400,
                          Colors.black,
                        ),
                      ),
                      Text(
                        "10%",
                        style: Dimensions.customTextStyle(
                          17,
                          FontWeight.w400,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Calculation",
                        style: Dimensions.customTextStyle(
                          17,
                          FontWeight.w400,
                          Colors.black,
                        ),
                      ),
                      Text(
                        "20KD / 1KD = 19KD",
                        style: Dimensions.customTextStyle(
                          17,
                          FontWeight.w400,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(width: 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Text(
                    "PAYMENT METHOD",
                    style: Dimensions.customTextStyle(
                      8,
                      FontWeight.w600,
                      Colors.black,
                    ),
                  ),
                ),
                const Divider(
                  color: AppTheme.fieldOutlineColor,
                  thickness: 1.25,
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "CREDIT CARD",
                            style: Dimensions.customTextStyle(
                              8,
                              FontWeight.w600,
                              Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/icons/credit_cards.svg")
                    ],
                  ),
                ),
                Divider(
                  color: AppTheme.fieldOutlineColor,
                  thickness: 1.25,
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    children: [
                      AppSimpleTextField(
                          title: "",
                          height: 35,
                          isEmail: true,
                          width: MediaQuery.of(context).size.width,
                          borderWidth: 1,
                          borderRadius: 2,
                          hintText: "CARD NUMBERS",
                          controller:
                              conceptHomeMainScreenProvider.emailController,
                          fieldNameText: "",
                          onChange: (value) {
                            print(value);
                          },
                          keyboard: TextInputType.text),
                      SizedBox(height: 6),
                      AppSimpleTextField(
                          title: "",
                          height: 35,
                          isEmail: true,
                          width: MediaQuery.of(context).size.width,
                          borderWidth: 1,
                          borderRadius: 2,
                          hintText: "CARD NUMBERS",
                          controller:
                              conceptHomeMainScreenProvider.emailController,
                          fieldNameText: "",
                          onChange: (value) {
                            print(value);
                          },
                          keyboard: TextInputType.text),
                      SizedBox(height: 6),
                      AppSimpleTextField(
                          title: "",
                          height: 35,
                          isEmail: true,
                          width: MediaQuery.of(context).size.width,
                          borderWidth: 1,
                          borderRadius: 2,
                          hintText: "CARD NUMBERS",
                          controller:
                              conceptHomeMainScreenProvider.emailController,
                          fieldNameText: "",
                          onChange: (value) {
                            print(value);
                          },
                          keyboard: TextInputType.text),
                    ],
                  ),
                ),
                Divider(
                  color: AppTheme.fieldOutlineColor,
                  thickness: 1.25,
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "KNET",
                              style: Dimensions.customTextStyle(
                                8,
                                FontWeight.w600,
                                Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: AppTheme.knetLogoColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          child: SvgPicture.asset("assets/icons/knet_logo.svg"),
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                const Divider(
                  color: AppTheme.fieldOutlineColor,
                  thickness: 1.25,
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "APPLE PAY",
                              style: Dimensions.customTextStyle(
                                8,
                                FontWeight.w600,
                                Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          child:
                              SvgPicture.asset("assets/icons/apple_logo.svg"),
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                const Divider(
                  color: AppTheme.fieldOutlineColor,
                  thickness: 1.25,
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 27.0, vertical: 10),
                  child: InspoButton(
                    text: "PAY NOW",
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    buttonColor: AppTheme.whiteColor,
                    buttonRadius: 8,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                    borderWidth: 2,
                    onPressed: () {
                      conceptHomeMainScreenProvider.setDialogVisible(false);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
