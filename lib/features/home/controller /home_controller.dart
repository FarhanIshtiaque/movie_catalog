import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:movie_catalog/config/network_service/network_service.dart';
import 'package:movie_catalog/core/constants/api_endpoints.dart';
import 'package:movie_catalog/core/helper/logger.dart';
import 'package:movie_catalog/features/home/data/popular_movie_model.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;

  var popularMovie = <Movies>[].obs;

  HttpService httpService = HttpService();
  @override
  void onInit() {
    super.onInit();
    httpService.init();
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {

    final dataMap = {'language': 'en-US', 'page': 1};
    try {
      isLoading(true);
      final result = await httpService.request(
          url: ApiEndPoints.popular, method: Method.GET, authToken: ApiEndPoints.apiKey, params: dataMap);

      if (result != null) {
        if (result is Response) {
          var data = result.data;
          PopularMovieModel popularMovieModel = PopularMovieModel.fromJson(data);
          popularMovie.addAll(popularMovieModel.results);
          logger.d(popularMovie);

        } else {
          isLoading(false);
        }
      }
    } finally {
      isLoading(false);
    }
  }





  final List<TVSeries> series = [
    TVSeries(name: 'Stranger Things', imageUrl: 'assets/stranger_things.jpg'),
    TVSeries(name: 'The Flash', imageUrl: 'assets/the_flash.jpg'),
    TVSeries(name: 'Money Heist', imageUrl: 'assets/money_heist.jpg'),
    TVSeries(name: 'Doctor Who', imageUrl: 'assets/doctor_who.jpg'),
    // Add more series as needed
  ];
}


class TVSeries {
  final String name;
  final String imageUrl;

  TVSeries({required this.name, required this.imageUrl});
}