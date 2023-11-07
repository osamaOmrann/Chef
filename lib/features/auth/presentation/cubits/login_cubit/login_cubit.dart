import 'package:chef/core/database/api/end_points.dart';
import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/core/services/service_locator.dart';
import 'package:chef/features/auth/data/models/login_model.dart';
import 'package:chef/features/auth/data/repository/auth_repository.dart';
import 'package:chef/features/auth/presentation/cubits/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepository authRepo;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  LoginModel? loginModel;

  void login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
        email: emailController.text, password: passwordController.text);
    result.fold((l) => emit(LoginErrorState(l)), (r) async {
      loginModel = r;
      await sl<CacheHelper>().saveData(key: APIKeys.token, value: r.token);
      emit(LoginSuccessState());
    });
  }
}
