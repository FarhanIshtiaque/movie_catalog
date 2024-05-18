import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:movie_catalog/config/network_service/network_service.dart';
import 'package:movie_catalog/core/constants/api_endpoints.dart';
import 'package:movie_catalog/features/details/data/movie_cast_model.dart';
import 'package:movie_catalog/features/details/data/movie_details_model.dart';

class MovieDetailsController extends GetxController{
  HttpService httpService = HttpService();
  var isLoading = false.obs;
  // arguments
  final movieId = Get.arguments;
  MovieDetailsModel? movieDetailsModel;
  var genres = <Genre>[].obs;
  var casts = <Cast>[].obs;

  @override
  void onInit() {
    super.onInit();
    httpService.init();
    getMovieDetails();
    getMovieCasts();
  }
  Future<void> getMovieDetails() async {
    try {
      isLoading(true);

      final result =
      await httpService.request(url: "movie/$movieId?language=en-US", method: Method.GET,authToken: ApiEndPoints.apiKey);

      if (result != null) {
        if (result is Response) {
          var data = result.data;
          //   logger.d(data);
          if (result.statusCode == 200) {
            movieDetailsModel = MovieDetailsModel.fromJson(data);
            genres.addAll(movieDetailsModel!.genres);


            isLoading(false);
          }
        } else {
          isLoading(false);
        }
      }
    } finally {
      isLoading(false);
    }
  }
  Future<void> getMovieCasts() async {
    try {
      isLoading(true);

      final result =
      await httpService.request(url: "movie/$movieId/credits?language=en-US", method: Method.GET,authToken: ApiEndPoints.apiKey);

      if (result != null) {
        if (result is Response) {
          var data = result.data;
          //   logger.d(data);
          if (result.statusCode == 200) {
          MovieCastModel movieCastModel = MovieCastModel.fromJson(data);
            casts.addAll(movieCastModel.cast);


            isLoading(false);
          }
        } else {
          isLoading(false);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}