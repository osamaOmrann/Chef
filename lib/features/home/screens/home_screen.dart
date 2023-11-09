import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/features/home/components/gnav_component.dart';
import 'package:chef/features/home/home_cubit/home_cubit.dart';
import 'package:chef/features/home/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return Scaffold(
      body: BlocProvider.of<HomeCubit>(context).screens[BlocProvider.of<HomeCubit>(context).currentIndex],
      bottomNavigationBar: GNavComponent(),
    );
  },
);
  }
}
