import 'package:clean_architecture_template/presentation/view_models/edit_profile_VM.dart';
import 'package:clean_architecture_template/presentation/widgets/app_simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../widgets/inspo_button.dart';

class InspoEditProfileScreen extends StatefulWidget {
  const InspoEditProfileScreen({Key? key}) : super(key: key);

  @override
  State<InspoEditProfileScreen> createState() => _InspoEditProfileScreen();
}

class _InspoEditProfileScreen extends State<InspoEditProfileScreen> {
  final EditProfileScreenVM authenticationScreenVM = EditProfileScreenVM();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<EditProfileScreenVM>(
          builder: (context,model,builder){
            return Column(
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
                        "EDIT PROFILE",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      InspoButton(
                        text: "Done",
                        width: 82,
                        height: 28,
                        buttonColor: Colors.black,
                        buttonRadius: 20,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        borderWidth: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child:  Container(
                      margin: EdgeInsets.symmetric(horizontal: 47),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 27),
                                  height: 155,
                                  child: Image.asset("assets/images/profile_image_highlighted.png"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "NAME",
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
                                  isName: true,
                                  hintText: "INSPIRED EDIBLES",
                                  controller: model.usernameController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
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
                                  controller: model.emailController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "PASSWORD",
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
                                  hintText: "GOTINSPOOOO003",
                                  controller: model.passwordController,
                                  isPass: true,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "ABOUT ME",
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
                                  hintText: "i like food",
                                  controller: model.bioController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "PREFERED TIMING",
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
                                  hintText: "9AM - 10PM",
                                  controller: model.preferredTimingController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "SOCIALS",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "INSTAGRAM",
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
                                  hintText: "@GOTINSPO",
                                  controller: model.instagramController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "TWITTER",
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
                                  hintText: "@INSPOGOTWITTER",
                                  controller: model.twitterController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "TIK-TOK",
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
                                  hintText: "@INSPOGOTIKTOK",
                                  controller: model.tiktokController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "YOUTUBE",
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
                                  hintText: "@INSPOGOT-YT",
                                  controller: model.youtubeController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "YOUR HOUSE DELIVERY ADDRESS",
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
                                  hintText: "KUWAIT CITY < ST 66 < BLOCK 6",
                                  controller: model.addressController,
                                  fieldNameText: "",
                                  hasBorders: false,
                                  onChange: (value){
                                    print(value);
                                  },
                                  keyboard: TextInputType.emailAddress
                              ),
                            ],
                          )
                          ],
                      ),
                    )
                )
              ],

            );
          },
        ),
      ),
    );
  }
}
