import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:movie_catalog/config/network_service/network_service.dart';
import 'package:movie_catalog/core/constants/api_endpoints.dart';
import 'package:movie_catalog/core/helper/debouncer.dart';
import 'package:movie_catalog/core/helper/logger.dart';
import 'package:movie_catalog/core/resource/local_storage/local_storage.dart';
import 'package:movie_catalog/features/home/data/movie_store.dart';
import 'package:movie_catalog/features/home/data/popular_movie_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var typing = false.obs;
  var popularMovie = <Movies>[].obs;
  var searchMovie = <Movies>[].obs;
  var favouriteMovies = <MovieData>[].obs;
  final searchController = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 300);
  HttpService httpService = HttpService();
  final  localStorage = LocalStorage();
  var currentIndex = 0.obs;
  final PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void onInit() {
    super.onInit();
    httpService.init();
    fetchFavouriteMovies();
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    final dataMap = {'language': 'en-US', 'page': 1};
    try {
      isLoading(true);
      final result = await httpService.request(
          url: ApiEndPoints.popular,
          method: Method.GET,
          authToken: ApiEndPoints.apiKey,
          params: dataMap);

      if (result != null) {
        if (result is Response) {
          var data = result.data;
          PopularMovieModel popularMovieModel =
              PopularMovieModel.fromJson(data);
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

  Future<void> getSearchMovies({required String query}) async {
    final dataMap = {
      'language': 'en-US',
      'page': 1,
      'include_adult': false,
      'query': query
    };
    try {
      isLoading(true);
      final result = await httpService.request(
          url: ApiEndPoints.search,
          method: Method.GET,
          authToken: ApiEndPoints.apiKey,
          params: dataMap);

      if (result != null) {
        if (result is Response) {
          searchMovie.clear();
          var data = result.data;
          PopularMovieModel popularMovieModel =
              PopularMovieModel.fromJson(data);
          searchMovie.addAll(popularMovieModel.results);
          logger.d(searchMovie);
        } else {
          isLoading(false);
        }
      }
    } finally {
      isLoading(false);
    }
  }





  void fetchFavouriteMovies() async{
    final allTask = await localStorage.getMovies();
    favouriteMovies.assignAll(allTask);

  }



  void addMovie(
      {
        required String title,
        required String url,
        required int id

      }) {

    MovieData data = MovieData(
      id: id,
      title: title,

      url: url,
    );
    favouriteMovies.add(data);
    localStorage.insertMovie(data);

    Get.back();
    Get.snackbar('Success', "Your Movie added successfully");
  }

  void deleteMovie(int id){
    localStorage.deleteMovie(id);
    favouriteMovies.removeWhere((task) => task.id == id);

    Get.back();
    Get.snackbar('Success', 'Task deleted');
  }

}
