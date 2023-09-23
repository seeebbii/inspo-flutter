import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../config/router/app_router.dart';
import '../../../utils/dimensions.dart';
import '../../notifiers/bottomNavBar.notifier.dart';
import '../../notifiers/ibanScreenPageView.notifier.dart';
import '../../view_models/authentication_VM.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/inspo_bottom_nav.dart';
import '../../widgets/inspo_button.dart';

class InspoPaymentMainScreen extends StatelessWidget {
  const InspoPaymentMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalSpaces),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "ENTER IBAN NUMBER",
                      style: Dimensions.customTextStyle(
                        33.9,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.2,
              ),
              Row(
                children: [
                  Text(
                    "IBAN",
                    style: Dimensions.customTextStyle(
                      21,
                      FontWeight.w600,
                      Colors.black,
                    ),
                  ),
                  SizedBox(width: 3),
                  GestureDetector(
                    onTap: () {
                      context.read<IBANPageViewProvider>().selectIndex(0);
                      context.push(AppRouter.ibanInfoScreen);
                    },
                    child: SvgPicture.asset("assets/icons/iban_info.svg"),
                  )
                ],
              ),
              Consumer<AuthenticationScreenVM>(
                  builder: (context, model, builder) {
                return AppSimpleTextField(
                    title: "",
                    height: 55,
                    hintText: "AA00 AAAA 0000 0000 0000 0000 0000",
                    width: MediaQuery.of(context).size.width,
                    borderWidth: 3,
                    marginTop: 5,
                    borderRadius: 8,
                    controller: model.emailController,
                    isEmail: true,
                    fieldNameText: "",
                    onChange: (value) {
                      print(value);
                    },
                    keyboard: TextInputType.emailAddress);
              }),
              SizedBox(
                height: context.height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31.0),
                child: InspoButton(
                  text: "Continue",
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  buttonColor: AppTheme.blackColor,
                  buttonRadius: 8,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.white,
                  borderWidth: 1,
                  onPressed: () {
                    context.push(AppRouter.otpVerificationScreen);
                  },
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ],
    );
  }
}
