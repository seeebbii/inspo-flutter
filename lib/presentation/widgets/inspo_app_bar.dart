import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InspoAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  const InspoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2.5),
        child: Container(
          color: Colors.black,
          height: 2.5,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          "INSPO",
          style: context.displaySmall,
        ),
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
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/account_appbar.svg",
          ),
        ),
      ],
    );
  }
}
