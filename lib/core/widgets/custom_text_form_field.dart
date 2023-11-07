import 'package:chef/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? lable;
  final String? Function(String?)? validate;
  final bool? isPassword;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;

  const CustomTextFormField(
      {required this.controller,
      this.hint,
      this.lable,
      this.validate,
      this.isPassword,
      this.icon,
      this.suffixIconOnPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
          hintText: hint,
          labelText: lable,
          suffixIcon: IconButton(
            onPressed: () => suffixIconOnPressed,
            icon: Icon(icon, color: AppColors.primary,),
          )),
      controller: controller,
      cursorColor: AppColors.primary,
    );
  }
}
