import 'dart:async';
import 'package:clean_architecture_template/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../config/router/app_router.dart';
import '../../../utils/dimensions.dart';
import '../../notifiers/addAddressScreen.notifier.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/inspo_button.dart';

class InspoAddAddressScreen extends StatefulWidget {
  InspoAddAddressScreen({Key? key}) : super(key: key);

  @override
  State<InspoAddAddressScreen> createState() =>
      _InspoAddAddressScreen();
}

class _InspoAddAddressScreen extends State<InspoAddAddressScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9),
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
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(19), topLeft: Radius.circular(19)),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Center(
                      child: SvgPicture.asset("assets/icons/arrow_down.svg")),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6),
                              child: Icon(Icons.arrow_back_sharp, size: 20),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "ADD ADDRESS",
                            style: Dimensions.customTextStyle(
                              15,
                              FontWeight.w700,
                              Colors.black,
                            ),
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(height: 17),
                  Container(
                    child: Divider(
                      color: AppTheme.fieldOutlineColor,
                      thickness: 2,
                      height: 0,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Image.asset("assets/images/map_sample2.png",fit: BoxFit.cover),

              ),
              Expanded(
                child: Consumer<AddAddressScreenNotifier>(
                  builder: (context, model, builder){
                    return ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSimpleTextField(
                                  title: "Area",
                                  height: 53,
                                  width: MediaQuery.of(context).size.width,
                                  borderWidth: 2,
                                  marginTop: 3,
                                  titleFontWeight: FontWeight.w400,
                                  borderRadius: 9,
                                  controller: model.areaController,
                                  fieldNameText: "",
                                  onChange: (value) {
                                    print(value);
                                  },
                                  keyboard: TextInputType.streetAddress),
                              SizedBox(height: 8),
                              AppSimpleTextField(
                                  title: "Block",
                                  height: 53,
                                  width: MediaQuery.of(context).size.width,
                                  borderWidth: 2,
                                  marginTop: 3,
                                  titleFontWeight: FontWeight.w400,
                                  borderRadius: 9,
                                  controller: model.blockController,
                                  fieldNameText: "",
                                  onChange: (value) {
                                    print(value);
                                  },
                                  keyboard: TextInputType.streetAddress),
                              SizedBox(height: 8),
                              AppSimpleTextField(
                                  title: "Street",
                                  height: 53,
                                  width: MediaQuery.of(context).size.width,
                                  borderWidth: 2,
                                  marginTop: 3,
                                  titleFontWeight: FontWeight.w400,
                                  borderRadius: 9,
                                  controller: model.streetController,
                                  fieldNameText: "",
                                  onChange: (value) {
                                    print(value);
                                  },
                                  keyboard: TextInputType.streetAddress),
                              SizedBox(height: 8),
                              Text(
                                "Address type",
                                style: Dimensions.customTextStyle(
                                  16,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      model.setAddressType(0);
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          "APARTMENT",
                                          style: Dimensions.customTextStyle(
                                            13,
                                            FontWeight.w700,
                                            model.addressType == 0 ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: model.addressType == 0 ? Colors.black : Colors.transparent,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      model.setAddressType(1);
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 28),
                                        child: Text(
                                          "HOUSE",
                                          style: Dimensions.customTextStyle(
                                            13,
                                            FontWeight.w700,
                                            model.addressType == 1 ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: model.addressType == 1 ? Colors.black : Colors.transparent,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      model.setAddressType(2);
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 27),
                                        child: Text(
                                          "OFFICE",
                                          style: Dimensions.customTextStyle(
                                            13,
                                            FontWeight.w700,
                                            model.addressType == 2 ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: model.addressType == 2 ? Colors.black : Colors.transparent,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              AppSimpleTextField(
                                  title: "House number",
                                  height: 53,
                                  width: MediaQuery.of(context).size.width,
                                  borderWidth: 2,
                                  marginTop: 3,
                                  titleFontWeight: FontWeight.w400,
                                  borderRadius: 9,
                                  controller: model.houseNumberController,
                                  fieldNameText: "",
                                  onChange: (value) {
                                    print(value);
                                  },
                                  keyboard: TextInputType.streetAddress),
                              SizedBox(height: 8),
                              AppSimpleTextField(
                                  title: "Name of address",
                                  height: 53,
                                  width: MediaQuery.of(context).size.width,
                                  borderWidth: 2,
                                  marginTop: 3,
                                  titleFontWeight: FontWeight.w400,
                                  borderRadius: 9,
                                  controller: model.nameOfAddressController,
                                  fieldNameText: "",
                                  onChange: (value) {
                                    print(value);
                                  },
                                  keyboard: TextInputType.streetAddress),
                              SizedBox(height: 8),
                              AppSimpleTextField(
                                  title: "Contact number",
                                  height: 53,
                                  width: MediaQuery.of(context).size.width,
                                  borderWidth: 2,
                                  marginTop: 3,
                                  titleFontWeight: FontWeight.w400,
                                  borderRadius: 9,
                                  controller: model.contactNumberController,
                                  fieldNameText: "+965 pre exisiting number pre added",
                                  onChange: (value) {
                                    print(value);
                                  },
                                  keyboard: TextInputType.streetAddress),
                              SizedBox(height: 8),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 18),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset("assets/icons/locator.svg"),
                                          SizedBox(width: 5),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "DELIVERY LOCATION",
                                                style: Dimensions.customTextStyle(
                                                  15,
                                                  FontWeight.w700,
                                                  Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "7xpg_fxp, kuwait",
                                                style: Dimensions.customTextStyle(
                                                  15,
                                                  FontWeight.w500,
                                                  Colors.black,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 21),
                                      InspoButton(
                                        text: "READY??",
                                        height: 56,
                                        buttonColor: Colors.white,
                                        buttonRadius: 9,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600,
                                        textColor: Colors.black,
                                        borderWidth: 2,
                                        onPressed: (){
                                          context.push(AppRouter.inspoAddAddressScreen);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                        )
                      ],
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
