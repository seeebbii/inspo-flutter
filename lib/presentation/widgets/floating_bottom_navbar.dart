import 'package:family_tree/presentation/view_models/home_VM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../config/app_theme.dart';
import '../../utils/dimensions.dart';

class FloatingBottomNavbar extends StatelessWidget {
  const FloatingBottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenVM homeScreenVM = context.watch<HomeScreenVM>();
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimensions.navigationBarHorizontalPadding,
        vertical: Dimensions.navigationBarVerticalPadding,
      ),
      height: Dimensions.navigationBarHeight,
      decoration: BoxDecoration(
        gradient: AppTheme.elevatedButtonGradient,
        borderRadius: const BorderRadius.all(
          Radius.circular(Dimensions.navigationBarBorderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.navigationBarHorizontalPadding * 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: ['feed', 'events', 'family', 'profile'].map(
            (title) {
              final index =
                  ['feed', 'events', 'family', 'profile'].indexOf(title);
              return NavBarItem(
                title: title,
                onTap: () {
                  homeScreenVM.setCurrentIndex(index);
                },
                isSelected: homeScreenVM.currentIndex == index,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Dimensions.navigationBarIconHeight,
                child: SvgPicture.asset(
                  'assets/icons/$title.svg',
                  color:
                      isSelected ? Colors.white : Colors.white.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: Dimensions.navigationBarLabelSpacing),
              Text(
                title.capitalizeFirst!,
                style: TextStyle(
                  fontFamily: 'Aeonik',
                  fontSize: Dimensions.navigationBarFontSize,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelected ? Colors.white : Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
