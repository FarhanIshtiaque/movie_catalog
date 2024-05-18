import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/config/routes/app_pages.dart';
import 'package:movie_catalog/core/resource/dependency_injection.dart';
import 'package:movie_catalog/core/resource/injectable_container.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return      ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        getPages: AppPages.pages,
        initialRoute: Routes.HOME,

      ),
    );
  }
}

