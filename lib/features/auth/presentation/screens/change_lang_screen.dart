import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/bloc/cubit/global_state.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/utils/app_assets.dart';
import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/widgets/custom_button.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLangScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            CustomImage(imagePath: AppAssets.background2),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    height: height * .13,
                  ),
                  CustomImage(
                    imagePath: AppAssets.appLogo,
                    w: width * .3,
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  Text(
                    AppStrings.welcomeToChefApp.tr(context),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: width * .07),
                  ),
                  SizedBox(
                    height: height * .07,
                  ),
                  Text(
                    AppStrings.pleaseChooseYourLanguage.tr(context),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: height * .13,
                  ),
                  BlocBuilder<GlobalCubit, GlobalState>(
  builder: (context, state) {
    return Row(
                    children: [
                      CustomButton(
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context).changeLangToEnglish();
                          },
                          text: 'English',
                          height: height * .05,
                          background: AppColors.black,
                          width: width * .35),
                      Spacer(),
                      CustomButton(
                          onPressed: () {
                            BlocProvider.of<GlobalCubit>(context).changeLangToArabic();
                          },
                          text: 'العربية',
                          height: height * .05,
                          background: AppColors.black,
                          width: width * .35),
                    ],
                  );
  },
)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
