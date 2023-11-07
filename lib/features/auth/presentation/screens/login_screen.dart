import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routes.dart';
import 'package:chef/core/utils/app_assets.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/utils/commons.dart';
import 'package:chef/core/widgets/custom_button.dart';
import 'package:chef/core/widgets/custom_image.dart';
import 'package:chef/core/widgets/custom_loading_indicator.dart';
import 'package:chef/core/widgets/custom_text_form_field.dart';
import 'package:chef/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef/features/auth/presentation/cubits/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomImage(
                    imagePath: AppAssets.loginBackground,
                    w: double.infinity,
                  ),
                  Center(
                      child: Text(
                    AppStrings.welcomeBack.tr(context),
                    style: Theme.of(context).textTheme.displayLarge,
                  ))
                ],
              ),
              SizedBox(
                height: height * .1,
              ),
              Padding(
                padding: EdgeInsets.all(width * .07),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      showToast(
                          message: AppStrings.loginSucessfully.tr(context),
                          state: ToastStates.success);
                    }
                    if (state is LoginErrorState) {
                      showToast(
                          message: state.message, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<LoginCubit>(context).loginKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailController,
                            hint: AppStrings.email.tr(context),
                            validate: (data) {
                              if (data!.trim().isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return AppStrings.pleaseEnterValidEmail
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            hint: AppStrings.password.tr(context),
                            isPassword: BlocProvider.of<LoginCubit>(context)
                                .isLoginPasswordShowing,
                            icon:
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                            suffixIconOnPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .changeLoginPasswordSuffixIcon();
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
                            height: height * .03,
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    navigate(
                                        context: context,
                                        route: Routes.sendCode);
                                  },
                                  child: Text(
                                    AppStrings.forgetPassword.tr(context)
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: height * .08,
                          ),
                          state is LoginLoadingState
                              ? CustomLoadingIndicator()
                              : CustomButton(
                                  onPressed: () {
                                    if (BlocProvider.of<LoginCubit>(context)
                                        .loginKey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<LoginCubit>(context)
                                          .login();
                                    }
                                  },
                                  text: AppStrings.signIn.tr(context))
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
