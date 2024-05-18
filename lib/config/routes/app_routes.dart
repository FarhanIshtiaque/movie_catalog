import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_catalog/config/routes/app_pages.dart';
import 'package:movie_catalog/features/details/screen/movie_details.dart';
import 'package:movie_catalog/features/home/screens/home.dart';


abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => const Home()),
    GetPage(name: Routes.MOVIEDETAILS, page: () => const MovieDetails()),


  ];
}
