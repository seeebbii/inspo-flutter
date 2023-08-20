import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../config/router/app_router.dart';
import '../../../utils/dimensions.dart';
import '../../notifiers/bottomNavBar.notifier.dart';
import '../../view_models/authentication_VM.dart';
import '../../widgets/inspo_bottom_nav.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    AuthenticationScreenVM authenticationScreenVM =
    Provider.of<AuthenticationScreenVM>(context, listen: true);

    return Scaffold(
      appBar: const InspoAppBar(),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(19),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 18, right: 18),
                  //     width: 33,
                  //     height: 33,
                  //     child: IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.close,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Text(
                    "WELCOME TO THE APP",
                    style: Dimensions.customTextStyle(
                      24,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  Text(
                    "HELOOO, AS YOU SEE YOUR ON THIS ONE OF ONE PLATFORM SPECIALLY DESIGNED WITH YOU IN MIND , ENGINEERED TO BRIDGE THE GAP BETWEEN YOU AND CONCEPTS EXPLORE AND COVER IT ALL.",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w400,
                      Colors.black,
                    ),
                  ),
                  InspoButton(
                    text: "ENTER!!",
                    width: 110,
                    height: 36,
                    marginTop: 25,
                    marginBottom: 75,
                    buttonColor: Colors.white,
                    buttonRadius: 8,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                    borderWidth: 1,
                    onPressed: () {
                      authenticationScreenVM.userType == 0 ?
                      context.go(AppRouter.homeMainScreen) :
                      context.go(AppRouter.conceptHomeMainScreen);
                    },
                  ),

                  Text(
                    "FOLLOW OUR SOCIALS ",
                    style: Dimensions.customTextStyle(
                      24,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  Text(
                    "YK THE VIBES FOLLOW US ON THE DAGRAM AND THE OTHER SOCIALS",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w400,
                      Colors.black,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Image.asset("assets/images/image_placeholder_wide.png")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
