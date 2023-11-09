import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/bloc/cubit/global_state.dart';
import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routes.dart';
import 'package:chef/core/services/service_locator.dart';
import 'package:chef/core/theme/app_theme.dart';
import 'package:chef/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:chef/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:chef/features/home/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
        sl<GlobalCubit>()
          ..getCachedLang(),
      ),
      BlocProvider(
        create: (context) => sl<LoginCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<ForgetPasswordCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<HomeCubit>(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: [
            Locale('ar', "EG"),
            Locale('en', "UK"),
          ],
          locale: Locale(BlocProvider
              .of<GlobalCubit>(context)
              .langCode),
          initialRoute: Routes.initialRoute,
          onGenerateRoute: AppRoutes.generateRoute,
          theme: getAppTheme(),
        );
      },
    );
  }
}