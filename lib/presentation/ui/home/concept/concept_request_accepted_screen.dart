import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../utils/dimensions.dart';
import '../../../notifiers/bottomNavBar.notifier.dart';
import '../../../notifiers/conceptHomeScreen.notifier.dart';
import '../../../widgets/app_simple_text_field.dart';
import '../../../widgets/inspo_button.dart';

class ConceptRequestAcceptedSreen extends StatelessWidget {
  List<bool> _checkBoxValues = List.generate(8, (index) => false);
  TextEditingController _locationController = TextEditingController();

  ConceptRequestAcceptedSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConceptHomeScreenNotifier>(
        builder: (context, model, builder) {
      return Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 19),
              GestureDetector(
                onTap: () {},
                child: Text("REQUESTS",
                    style: TextStyle(
                        fontFamily: "assets/fonts/Halvetica.ttf",
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
              ),
              Container(
                width: 20,
                height: 25,
                child: IconButton(
                  icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/avtar.png"),
                                SizedBox(width: 10),
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
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: SvgPicture.asset(
                                        "assets/icons/instagram.svg")),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "WANTS TO COVER YOUR CONCEPT",
                              style: Dimensions.customTextStyle(
                                16,
                                FontWeight.w400,
                                AppTheme.blackColor,
                              ),
                            ),
                            SizedBox(height: 15),
                            InspoButton(
                              text: "ACCEPT",
                              height: 50,
                              marginTop: 5,
                              buttonColor: AppTheme.lightGreen,
                              buttonRadius: 7,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              borderWidth: 1,
                              textColor: Colors.black,
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 5.3,
                            ),
                            Text(
                              "SET A DATE",
                              style: Dimensions.customTextStyle(
                                18,
                                FontWeight.w600,
                                Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 5.3,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (_) {
                                    final size = MediaQuery.of(context).size;
                                    return Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                      height: size.height * 0.27,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (value) {
                                          model.setDate(value);
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(width: 1)),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      model.date == null ? "SEP 17, 2023" : DateFormat("MMM dd, yyyy").format(model.date!),
                                      style: Dimensions.customTextStyle(
                                        12.19,
                                        FontWeight.w600,
                                        Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Visibility(
                              visible: model.date == null ? false : true,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "SET A TIME",
                                      style: Dimensions.customTextStyle(
                                        18,
                                        FontWeight.w600,
                                        Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.3,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await showCupertinoModalPopup<void>(
                                          context: context,
                                          builder: (_) {
                                            final size = MediaQuery.of(context).size;
                                            return Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                ),
                                              ),
                                              height: size.height * 0.27,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode.time,
                                                onDateTimeChanged: (value) {
                                                  model.setTime(value);
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(width: 1)),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Text(
                                              model.time == null ? "8:00 PM" : DateFormat("h:mm a").format(model.time!),
                                              style: Dimensions.customTextStyle(
                                                12.19,
                                                FontWeight.w600,
                                                Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                  ],
                                )
                            ),
                            Visibility(
                              visible: model.time == null ? false : true,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "REQUIREMENTS",
                                      style: Dimensions.customTextStyle(
                                        18,
                                        FontWeight.w600,
                                        Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 15),

                                    Container(
                                      height: 130,
                                      width: MediaQuery.of(context).size.width,
                                      child: GridView.builder(
                                        itemCount: model.checkboxes.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: (60 / 25),
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 0.85,
                                          mainAxisSpacing: 0.85,
                                        ),
                                        itemBuilder: (context, index) {
                                          final checkbox = model.checkboxes[index];
                                          return GestureDetector(
                                            onTap: () {
                                              model.toggleCheckbox(index);
                                            },
                                            child: Container(
                                              color: Colors.white,
                                              padding: EdgeInsets.all(10), // Adjust padding as needed
                                              child: CustomCheckBox(
                                                checkbox.isChecked,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    SizedBox(
                                      height: 12.3,
                                    ),

                                    Text(
                                      "SET ITEM TYPE",
                                      style: Dimensions.customTextStyle(
                                        18,
                                        FontWeight.w600,
                                        Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11.0,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InspoButton(
                                            text: "DELIVERY",
                                            height: 59,
                                            marginTop: 5,
                                            buttonColor: model.isDelivery ? AppTheme.black : AppTheme.whiteColor,
                                            buttonRadius: 7,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            borderWidth: 1,
                                            textColor: model.isDelivery ? Colors.white : Colors.black,
                                            onPressed: () {
                                              model.setDelivery(true);
                                              model.setInStore(false);
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 14),
                                        Expanded(
                                          child: InspoButton(
                                            text: "IN-STORE",
                                            height: 59,
                                            marginTop: 5,
                                            buttonColor: model.isInStore ? AppTheme.black : AppTheme.whiteColor,
                                            buttonRadius: 7,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            borderWidth: 1,
                                            textColor: model.isInStore ? Colors.white : Colors.black,
                                            onPressed: () {
                                              model.setDelivery(false);
                                              model.setInStore(true);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 9.3,
                                    ),
                                    Visibility(
                                      visible: model.isInStore ? true : false,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "LOCATION",
                                              style: Dimensions.customTextStyle(
                                                18,
                                                FontWeight.w600,
                                                Colors.black,
                                              ),
                                            ),
                                            AppSimpleTextField(
                                                height: 55,
                                                width: MediaQuery.of(context).size.width,
                                                isEmail: true,
                                                hintText: "GOTINSPO@EMAIL.COM",
                                                marginBottom: 20,
                                                controller: _locationController,
                                                fieldNameText: "",
                                                borderWidth: 1,
                                                borderRadius: 6,
                                                hasBorders: true,
                                                onChange: (value) {
                                                  print(value);
                                                },
                                                keyboard: TextInputType.emailAddress),
                                          ],
                                        )
                                    ),

                                    SizedBox(
                                      height: 25.0,
                                    ),

                                    InspoButton(
                                      text: "CONFRIM",
                                      height: 59,
                                      marginLeft: 90,
                                      marginRight: 90,
                                      buttonColor: AppTheme.whiteColor,
                                      buttonRadius: 9,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      borderWidth: 2,
                                      textColor: Colors.black,
                                      onPressed: () {
                                      },
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }

  Widget CustomCheckBox(bool checked){
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black),
          ),
          child: checked
              ? Icon(
            Icons.check,
            color: Colors.black,
            size: 14,
          )
              : null,
        ),
        SizedBox(width: 5), // Adjust the spacing between checkbox and text
        Text(
          "TWEET",
          style: Dimensions.customTextStyle(
            8,
            FontWeight.w600,
            Colors.black,
          ),
        ),
      ],
    );
  }


}
