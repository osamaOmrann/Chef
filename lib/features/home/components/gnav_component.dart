import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/widgets/custom_google_nav_bar.dart';
import 'package:chef/features/home/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GNavComponent extends StatelessWidget {
  const GNavComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return CustomGoogleNavBar(currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex, tabs: [
      GButton(icon: Icons.menu, text: AppStrings.menu.tr(context)),
      GButton(icon: Icons.person, text: AppStrings.profile.tr(context),)
    ]);
  }
}
