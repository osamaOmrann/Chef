import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/database/api/api_consumer.dart';
import 'package:chef/core/database/api/dio_consumer.dart';
import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/features/auth/data/repository/auth_repository.dart';
import 'package:chef/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton<APIConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}