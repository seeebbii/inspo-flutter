import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../utils/dimensions.dart';
import '../../../notifiers/bottomNavBar.notifier.dart';
import '../../../notifiers/conceptHomeScreen.notifier.dart';
import '../../../widgets/app_simple_text_field.dart';
import '../../../widgets/inspo_button.dart';
import '../../../widgets/inspo_custom_drop_down.dart';

class ConceptRequestAcceptedSreen extends StatelessWidget {
  final List<bool> _checkBoxValues = List.generate(8, (index) => false);
  final TextEditingController _locationController = TextEditingController();
  final List<String> _location = [
    "GOODCUP > ARDIYA",
    "GOODCUP > CITY"
  ];

  ConceptRequestAcceptedSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);
    return Consumer<ConceptHomeScreenNotifier>(
        builder: (context, model, builder) {
      return Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 19),
              GestureDetector(
                onTap: () {},
                child: const Text("REQUESTS",
                    style: TextStyle(
                        fontFamily: "assets/fonts/Halvetica.ttf",
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
              ),
              SizedBox(
                width: 20,
                height: 25,
                child: IconButton(
                  icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
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
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                  "assets/icons/instagram.svg"),
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
                          const SizedBox(height: 24),
                          Text(
                            "SET A DATE",
                            style: Dimensions.customTextStyle(
                              18,
                              FontWeight.w600,
                              Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5.3),
                          GestureDetector(
                            onTap: () async {
                              await showCupertinoModalPopup<void>(
                                context: context,
                                builder: (_) {
                                  final size = MediaQuery.of(context).size;
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    height: size.height * 0.4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 80),
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (value) {
                                          model.setDate(value);
                                        },
                                      ),
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
                                    model.date == null
                                        ? "SEP 17, 2023"
                                        : DateFormat("MMM dd, yyyy")
                                            .format(model.date!),
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
                          const SizedBox(height: 18),
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
                                  const SizedBox(height: 5.3),
                                  GestureDetector(
                                    onTap: () async {
                                      await showCupertinoModalPopup<void>(
                                        context: context,
                                        builder: (_) {
                                          final size =
                                              MediaQuery.of(context).size;
                                          return Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            height: size.height * 0.4,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 80),
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .time,
                                                onDateTimeChanged: (value) {
                                                  model.setTime(value);
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(width: 1)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            model.time == null
                                                ? "8:00 PM"
                                                : DateFormat("h:mm a")
                                                    .format(model.time!),
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
                                  const SizedBox(height: 13),
                                ],
                              )),
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
                                  const SizedBox(height: 15),
                                  SizedBox(
                                    height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    child: GridView.builder(
                                      itemCount: model.checkboxes.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: (60 / 25),
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        final checkbox =
                                            model.checkboxes[index];
                                        return GestureDetector(
                                          onTap: () {
                                            model.toggleCheckbox(index);
                                          },
                                          child: Container(
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(10), // Adjust padding as needed
                                            child: CustomCheckBox(
                                              checkbox.isChecked,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 13.3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "DESCRIBE COVERAGE",
                                        style: Dimensions.customTextStyle(
                                          18,
                                          FontWeight.w600,
                                          Colors.black,
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
                                  SizedBox(height: 3),
                                  AppSimpleTextField(
                                      height: 97,
                                      width: MediaQuery.of(context)
                                          .size
                                          .width,
                                      isEmail: true,
                                      hintText: "400 character limit",
                                      controller: _locationController,
                                      marginTop: 5,
                                      fieldNameText: "",
                                      borderWidth: 1,
                                      borderRadius: 6,
                                      hasBorders: true,
                                      onChange: (value) {
                                        print(value);
                                      },
                                      keyboard:
                                      TextInputType.emailAddress),
                                  SizedBox(height: 13),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "BOOSTER",
                                        style: Dimensions.customTextStyle(
                                          18,
                                          FontWeight.w600,
                                          Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "OPTIONAL",
                                        style: Dimensions.customTextStyle(
                                          8,
                                          FontWeight.w600,
                                          AppTheme.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Container(
                                    height: 55,
                                    width: MediaQuery.of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6),
                                        border: Border.all(width: 1)),
                                    child: Center(
                                      child:Text(
                                        "10 KD",
                                        style: Dimensions.customTextStyle(
                                          18,
                                          FontWeight.w600,
                                          AppTheme.blackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 13,),
                                  Text(
                                    "SET ITEM TYPE",
                                    style: Dimensions.customTextStyle(
                                      18,
                                      FontWeight.w600,
                                      Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 13.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InspoButton(
                                          text: "DELIVERY",
                                          height: 59,
                                          marginTop: 5,
                                          buttonColor: model.isDelivery
                                              ? AppTheme.black
                                              : AppTheme.whiteColor,
                                          buttonRadius: 7,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          borderWidth: 1,
                                          textColor: model.isDelivery
                                              ? Colors.white
                                              : Colors.black,
                                          onPressed: () {
                                            model.setDelivery(true);
                                            model.setInStore(false);
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: InspoButton(
                                          text: "IN-STORE",
                                          height: 59,
                                          marginTop: 5,
                                          buttonColor: model.isInStore
                                              ? AppTheme.black
                                              : AppTheme.whiteColor,
                                          buttonRadius: 7,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          borderWidth: 1,
                                          textColor: model.isInStore
                                              ? Colors.white
                                              : Colors.black,
                                          onPressed: () {
                                            model.setDelivery(false);
                                            model.setInStore(true);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 9.3),
                                  Visibility(
                                      visible: model.isInStore ? true : false,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "LOCATION",
                                            style: Dimensions.customTextStyle(
                                              18,
                                              FontWeight.w600,
                                              Colors.black,
                                            ),
                                          ),
                                         Container(
                                           height:  model.isDropDownExpanded ? 130 : 50,
                                           decoration: BoxDecoration(
                                             border: model.isDropDownExpanded ? Border.all(width: 2,color: Colors.black) : null,
                                             borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0),topRight: Radius.circular(6.0)),
                                           ),
                                           child: Column(
                                             children: [
                                               GestureDetector(
                                                 onTap: (){
                                                   model.setDropDownExpanded(!model.isDropDownExpanded);
                                                 },
                                                 child: Container(
                                                   width: MediaQuery.of(context).size.width,
                                                   height: 45,
                                                   decoration: BoxDecoration(
                                                     border: model.isDropDownExpanded ? null : Border.all(width: 1,color: Colors.black),
                                                     borderRadius: model.isDropDownExpanded ? null :  BorderRadius.circular(6.0),
                                                   ),
                                                   child: Center(
                                                     child: Text(
                                                       model.seletedLocation == null ? "PICK YOUR BRANCH" : model.seletedLocation!,
                                                       style: Dimensions.customTextStyle(
                                                         13,
                                                         FontWeight.w600,
                                                         AppTheme.blackColor,
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                               Visibility(
                                                 visible: model.isDropDownExpanded ? true : false,
                                                 child: Expanded(
                                                   child: ListView.builder(
                                                       itemCount: _location.length,
                                                       itemBuilder: (context,index){
                                                         return GestureDetector(
                                                           onTap: (){
                                                             model.setSeletedLocation(_location[index]);
                                                             model.setDropDownExpanded(false);
                                                           },
                                                           child: Container(
                                                             decoration: BoxDecoration(
                                                               border: Border.all(width: 1,color: Colors.black),
                                                               borderRadius: BorderRadius.circular(0.0),
                                                             ),
                                                             child: Center(
                                                               child: Padding(
                                                                 padding: const EdgeInsets.symmetric(vertical: 11.0),
                                                                 child: Text(
                                                                   _location[index],
                                                                   style: Dimensions.customTextStyle(
                                                                     16,
                                                                     FontWeight.w400,
                                                                     AppTheme.blackColor,
                                                                   ),
                                                                 ),
                                                               ),
                                                             ),
                                                           ),
                                                         );
                                                       }
                                                   ),
                                                 ),
                                               )
                                             ],
                                           ),
                                         ),
                                         /* InspoCustomDropdown<String>(
                                            items: ["GOODCUP > ARDIYA", "GOODCUP > CITY"],
                                            selectedValue: selectedValue,
                                            onChanged: (value) {
                                              *//*setState(() {
                                                selectedValue = value;
                                              });*//*
                                            },
                                          ),*/
                                        ],
                                      )),
                                  const SizedBox(height: 25.0),
                                  InspoButton(
                                    text: "CONFIRM",
                                    height: 47,
                                    marginLeft: 90,
                                    marginRight: 90,
                                    buttonColor: AppTheme.whiteColor,
                                    buttonRadius: 9,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    borderWidth: 2,
                                    textColor: Colors.black,
                                    onPressed: () {
                                      provider.selectIndex(0);
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }

  Widget CustomCheckBox(bool checked) {
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
              ? const Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 14,
                )
              : null,
        ),
        const SizedBox(
            width: 5), // Adjust the spacing between checkbox and text
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
