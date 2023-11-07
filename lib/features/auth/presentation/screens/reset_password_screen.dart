import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routes.dart';
import 'package:chef/core/utils/app_assets.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/utils/commons.dart';
import 'package:chef/core/widgets/custom_button.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:chef/core/widgets/custom_loading_indicator.dart';
import 'package:chef/core/widgets/custom_text_form_field.dart';
import 'package:chef/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef/features/auth/presentation/cubits/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.createYourNewPassword.tr(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(height * .024),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if(state is ResetPasswordSuccess) {
                showToast(message: state.message, state: ToastStates.success);
                navigate(context: context, route: Routes.login);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).resetPasswordKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * .04, bottom: height * .015),
                      child: CustomImage(imagePath: AppAssets.lock),
                    ),
                    Text(
                      AppStrings.createYourNewPassword.tr(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * .026,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .newPasswordController,
                      hint: AppStrings.newPassword.tr(context),
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isNewPasswordShowing,
                      icon:
                      BlocProvider.of<ForgetPasswordCubit>(context).suffixIconNewPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeNewPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.trim().length < 6 ||
                            data.trim().isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * .026,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordController,
                      hint: AppStrings.confirmPassword.tr(context),
                      isPassword: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isConfirmPasswordShowing,
                      icon:
                      BlocProvider.of<ForgetPasswordCubit>(context).suffixIconConfirmPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeConfirmPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.trim().length < 6 ||
                            data.trim().isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        if (data != BlocProvider.of<ForgetPasswordCubit>(context).newPasswordController.text) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * .026,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context).codeController,
                      hint: AppStrings.code.tr(context),
                      validate: (data) {
                        if (data!.trim().isEmpty) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }
                        if (num.tryParse(data) == null) {
                          return AppStrings.pleaseEnterValidCode.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * .026,
                    ),
                    state is ResetPasswordLoading
                        ? CustomLoadingIndicator()
                        : CustomButton(
                        onPressed: () {
                          if (BlocProvider.of<ForgetPasswordCubit>(context)
                              .resetPasswordKey
                              .currentState!
                              .validate()) {
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .resetPassword();
                          }
                        },
                        text: AppStrings.changePassword.tr(context))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
