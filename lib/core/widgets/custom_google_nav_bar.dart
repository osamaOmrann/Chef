import 'package:chef/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomGoogleNavBar extends StatelessWidget {
  const CustomGoogleNavBar({super.key, required this.currentIndex, this.onChanged, required this.tabs});
  final int currentIndex;
  final Function(int)? onChanged;
  final List<GButton> tabs;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .06, vertical: height * .02),
      child: GNav(
        activeColor: AppColors.primary,
        selectedIndex: currentIndex,
        onTabChange: onChanged,
        gap: width * .05,
        tabBackgroundColor: AppColors.black12,
        tabBorderRadius: width * .04,
        padding: EdgeInsetsDirectional.all(width * .04),
        tabs: tabs,
      ),
    );
  }
}
