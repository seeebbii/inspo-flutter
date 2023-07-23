import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/router/app_router.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/inspo_button.dart';

class InspoNeedHelpScreen extends StatelessWidget {
  InspoNeedHelpScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16,left: 33,right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          GoRouter.of(context).refresh();
                        },
                        child: Container(
                          width: 38,
                          height: 28,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Icon(
                              Icons.arrow_back_sharp
                          ),
                        ),
                      ),
                      Text(
                        "NEED HELP?",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                Expanded(
                    child:  Container(
                      margin: EdgeInsets.symmetric(horizontal: 31),
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 75),
                            child: Text(
                              "CONTACT\nMESSAGE\nTALK TO US!",
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 75),
                            child: Text(
                              "EMAIL",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          AppSimpleTextField(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              marginTop: 12,
                              isEmail: true,
                              hintText: "GOTINSPO@EMAIL.COM",
                              controller: _emailController,
                              fieldNameText: "",
                              borderWidth: 3,
                              borderRadius: 10,
                              hasBorders: true,
                              onChange: (value){
                                print(value);
                              },
                              keyboard: TextInputType.emailAddress
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Text(
                              "MESSAGE",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          AppSimpleTextField(
                              height: 190,
                              width: MediaQuery.of(context).size.width,
                              marginTop: 12,
                              isEmail: true,
                              hintText: "Ask us Anything",
                              controller: _messageController,
                              fieldNameText: "",
                              borderWidth: 3,
                              borderRadius: 10,
                              hasBorders: true,
                              onChange: (value){
                                print(value);
                              },
                              keyboard: TextInputType.emailAddress
                          ),
                          InspoButton(
                            text: "Submit",
                            width: MediaQuery.of(context).size.width,
                            height: 56,
                            marginTop: 44,
                            buttonColor: Colors.black,
                            buttonRadius: 8,
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                            textColor: Colors.white,
                            borderWidth: 1,
                            onPressed: (){
                            },
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
      ),
    );
  }
}
