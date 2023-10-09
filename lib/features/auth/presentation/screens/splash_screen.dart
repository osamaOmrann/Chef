import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routes.dart';
import 'package:chef/core/utils/app_assets.dart';
import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/utils/commons.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateAfterThreeSeconds();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => navigate(context: context, route: Routes.changeLang));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(imagePath: AppAssets.appLogo, w: width * .3,),
            SizedBox(
              height: height * .02,
            ),
            Text(
              AppStrings.chefApp.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: width * .07),
            )
          ],
        ),
      ),
    );
  }
}
