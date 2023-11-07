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

class SendCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.forgetPassword.tr(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(height * .024),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if(state is SendCodeSuccess) {
                showToast(message: state.message, state: ToastStates.success);
                navigate(context: context, route: Routes.resetPassword);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * .04, bottom: height * .015),
                      child: CustomImage(imagePath: AppAssets.lock),
                    ),
                    Text(
                      AppStrings.forgetPassword.tr(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * .026,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context).emailController,
                      hint: AppStrings.email.tr(context),
                      validate: (data) {
                        if (data!.trim().isEmpty ||
                            !data.contains('@gmail.com')) {
                          return AppStrings.pleaseEnterValidEmail.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * .026,
                    ),
                    state is SendCodeLoading
                        ? CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<ForgetPasswordCubit>(context)
                                  .sendCodeKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .sendCode();
                              }
                            },
                            text: AppStrings.sendResetLink.tr(context))
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
