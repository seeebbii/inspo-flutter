import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';

class InspoConceptAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  const InspoConceptAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2.5),
        child: Container(
          color: Colors.black,
          height: 2.5,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "INSPO",
              style: context.displaySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "FOR CONCEPTS",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/event_appbar.svg",
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search_appbar.svg",
          ),
        ),
        IconButton(
          onPressed: () {
            _showAccountDialog(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/account_appbar.svg",
          ),
        ),
      ],
    );
  }

  void _showAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(width: 2, color: Colors.black),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: SvgPicture.asset(
                          "assets/icons/close.svg",
                        ),
                      ),
                  ),
                  SizedBox(height: 10),
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
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "CONTACT INFO",
                    style: Dimensions.customTextStyle(
                      21,
                      FontWeight.w600,
                      Colors.black,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "ADDRESS",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  Text(
                    "KUWAIT CITY , BLOCK 89 , ST 676 , HOUSE 921",
                    style: Dimensions.customTextStyle(
                      12,
                      FontWeight.w400,
                      Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "PHONE NUMBER",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  Text(
                    "+965 88883333",
                    style: Dimensions.customTextStyle(
                      12,
                      FontWeight.w400,
                      Colors.black,
                    ),
                  ),
                  SizedBox(height: 28),
                  Row(
                    children: [
                      SizedBox(width: 50),
                      Expanded(
                        child: InspoButton(
                          text: "SAVE",
                          height: 48,
                          marginTop: 5,
                          buttonColor: AppTheme.whiteColor,
                          buttonRadius: 9,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          borderWidth: 2,
                          textColor: Colors.black,
                          onPressed: () {

                          },
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: InspoButton(
                          text: "SHARE",
                          height: 48,
                          marginTop: 5,
                          buttonColor: AppTheme.whiteColor,
                          buttonRadius: 9,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          borderWidth: 2,
                          textColor: Colors.black,
                          onPressed: () {
                          },
                        ),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                  SizedBox(height: 33),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
