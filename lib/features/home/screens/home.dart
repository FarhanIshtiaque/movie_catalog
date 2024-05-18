import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:movie_catalog/config/routes/app_pages.dart';
import 'package:movie_catalog/core/constants/api_endpoints.dart';
import 'package:movie_catalog/core/constants/app_colors.dart';
import 'package:movie_catalog/core/constants/app_values.dart';
import 'package:movie_catalog/core/constants/text_styles.dart';
import 'package:movie_catalog/core/resource/widgets/primary_textfield.dart';
import 'package:movie_catalog/features/home/controller%20/home_controller.dart';
import 'package:movie_catalog/features/home/data/popular_movie_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Find Movies, Tv series, and More',
                style:
                    AppTextStyle.headingMedium.copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              const PrimaryTextField(
                hintText: 'Search here...',
                prefixIcon: HeroIcon(HeroIcons.magnifyingGlass),
              ),
              Obx(
                () => homeController.isLoading.value
                    ? const Center(
                        child: SizedBox(
                            height: 35, child: CircularProgressIndicator()),
                      )
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: .64,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemCount: homeController.popularMovie.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return MovieTile(

                            movies:   homeController.popularMovie[index],
                           onTap:    (){
                              Get.toNamed(Routes.MOVIEDETAILS,arguments:homeController.popularMovie[index].id );
                           }
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MovieTile extends StatelessWidget {

  const MovieTile({required this.movies, this.onTap});
  final Movies movies;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageUrl: ApiEndPoints.imageUrl + movies.posterPath,
                fadeInCurve: Curves.bounceOut,
                fadeInDuration: const Duration(seconds: 1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            movies.title,
            style: AppTextStyle.labelSmall.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
