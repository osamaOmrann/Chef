import 'package:chef/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String text;

  const CustomButton(
      {this.height = 48,
      this.width = double.infinity,
      required this.onPressed,
      this.background,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.white),
          ),
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor:
                  MaterialStateProperty.all(background ?? AppColors.primary)),
        ));
  }
}
