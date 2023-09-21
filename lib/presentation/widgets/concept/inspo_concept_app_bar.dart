import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../../notifiers/bottomNavBar.notifier.dart';
import '../inspo_button.dart';

class InspoConceptAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  const InspoConceptAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);
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
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "FOR CONCEPTS",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            provider.selectIndex(1);
          },
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
            provider.selectIndex(2);
          },
          icon: SvgPicture.asset(
            "assets/icons/account_appbar.svg",
          ),
        ),
      ],
    );
  }
}
