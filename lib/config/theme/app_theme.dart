
import 'package:flutter/material.dart';

import 'package:movie_catalog/core/constants/app_colors.dart';

ThemeData theme() {
  return ThemeData(
   useMaterial3: false,
    errorColor: AppColors.red600,
    primarySwatch: Colors.blue,
    fontFamily: 'Nunito',
    appBarTheme: appBarTheme(),
    backgroundColor: AppColors.white

  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    titleSpacing: 24,
    color: Colors.white,
    elevation: 0,
   // toolbarHeight: 70,
   // shadowColor: AppColors.gray50,
    centerTitle: false,

    iconTheme: IconThemeData(
      color: AppColors.black,

    ),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}
