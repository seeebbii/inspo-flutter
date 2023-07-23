import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../config/router/app_router.dart';
import '../../notifiers/bottomNavBar.notifier.dart';
import '../../widgets/inspo_bottom_nav.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavBarProvider>(
        builder: (context, model, builder) {
          return InspoBottomNavBar();
        },
      ),
      appBar: const InspoAppBar(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(19),
                  topRight: Radius.circular(19),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black, // Border color
                        width: 5.0, // Border width
                      ),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(19),
                      topRight: Radius.circular(19),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(top: 18, right: 18),
                            width: 33,
                            height: 33,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 40),
                          child: Text(
                            "WELCOME TO THE APP",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 21, top: 10, right: 23),
                          child: Text(
                            "HELOOO, AS YOU SEE YOUR ON THIS ONE OF ONE PLATFORM SPECIALLY DESIGNED WITH YOU IN MIND , ENGINEERED TO BRIDGE THE GAP BETWEEN YOU AND CONCEPTS EXPLORE AND COVER IT ALL.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        InspoButton(
                          text: "ENTER!!",
                          width: 110,
                          height: 36,
                          marginTop: 22,
                          marginLeft: 20,
                          buttonColor: Colors.white,
                          buttonRadius: 8,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          borderWidth: 1,
                          onPressed: () {
                            GoRouter.of(context).go(AppRouter.homeMainScreen);
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 40),
                          child: Text(
                            "FOLLOW OUR SOCIALS ",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 21, top: 10, right: 23),
                          child: Text(
                            "YK THE VIBES FOLLOW US ON THE DAGRAM AND THE OTHER SOCIALS",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 30, right: 20),
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                              "assets/images/image_placeholder_wide.png"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
