import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/dimensions.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/inspo_button.dart';

class InspoNeedHelpScreen extends StatelessWidget {
  InspoNeedHelpScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NEED HELP?",
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: context.height * 0.075),
                  child: Text(
                    "CONTACT MESSAGE TALK TO US!",
                    style: Dimensions.customTextStyle(
                      40,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.05),
                AppSimpleTextField(
                    title: "EMAIL",
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    isEmail: true,
                    hintText: "GOTINSPO@EMAIL.COM",
                    marginBottom: 20,
                    controller: _emailController,
                    fieldNameText: "",
                    borderWidth: 3,
                    borderRadius: 10,
                    hasBorders: true,
                    onChange: (value) {
                      print(value);
                    },
                    keyboard: TextInputType.emailAddress),
                AppSimpleTextField(
                  title: "MESSAGE",
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  hintText: "Ask us Anything",
                  controller: _messageController,
                  maxLines: 5,
                  fieldNameText: "",
                  borderWidth: 3,
                  borderRadius: 10,
                  hasBorders: true,
                  onChange: (value) {
                    print(value);
                  },
                  keyboard: TextInputType.text,
                ),
                const SizedBox(height: 25),
                InspoButton(
                  text: "Submit",
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  buttonColor: Colors.black,
                  buttonRadius: 8,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  textColor: Colors.white,
                  borderWidth: 1,
                  onPressed: () {},
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
