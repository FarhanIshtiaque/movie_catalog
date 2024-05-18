
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/config/routes/app_pages.dart';
import 'package:movie_catalog/core/constants/app_colors.dart';
import 'package:movie_catalog/core/constants/app_values.dart';
import 'package:movie_catalog/core/constants/text_styles.dart';
import 'package:movie_catalog/features/home/controller%20/home_controller.dart';
import 'package:movie_catalog/features/home/widgets/movie_tile.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
    body: Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: AppValues.horizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favourite Movies',
              style:
              AppTextStyle.headingMedium.copyWith(color: AppColors.white),
            ),
            const SizedBox(
              height: 16,
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
                      itemCount:  homeController.favouriteMovies.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return MovieTile(
                            title: homeController.favouriteMovies[index].title,
                            url: homeController.favouriteMovies[index].url,
                            onTap: () {
                              Get.toNamed(Routes.MOVIEDETAILS,
                                  arguments:  homeController.favouriteMovies[index].id);
                            });
                      }),
            )
          ],
        ),
      ),
    ),
    );
  }
}
