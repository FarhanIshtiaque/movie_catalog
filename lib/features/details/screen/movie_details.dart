import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:movie_catalog/core/constants/api_endpoints.dart';
import 'package:movie_catalog/core/constants/app_colors.dart';
import 'package:movie_catalog/core/constants/text_styles.dart';
import 'package:movie_catalog/core/helper/string_helper.dart';
import 'package:movie_catalog/features/details/controller/movie_details_controller.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final movieDetailsController = Get.put(MovieDetailsController());
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Obx(
          () => movieDetailsController.isLoading.value
              ? const Center(
                  child:
                      SizedBox(height: 36, child: CircularProgressIndicator()))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 380.h,
                      width: double.maxFinite,
                      child: CachedNetworkImage(
                        imageUrl: ApiEndPoints.imageUrl +
                            movieDetailsController
                                .movieDetailsModel!.posterPath.toString(),
                        //+ movies.posterPath,
                        fadeInCurve: Curves.bounceOut,
                        fadeInDuration: const Duration(seconds: 1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        movieDetailsController.movieDetailsModel!.title,
                        style: AppTextStyle.headingMedium
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: <Widget>[
                          const HeroIcon(
                            HeroIcons.clock,
                            color: AppColors.gray600,
                            size: 18,
                          ),
                          Text(
                            '  ${movieDetailsController.movieDetailsModel!.runtime} Min',
                            style: AppTextStyle.bodyMedium
                                .copyWith(color: AppColors.gray600),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const HeroIcon(
                            HeroIcons.star,
                            color: AppColors.gray600,
                            size: 18,
                            style: HeroIconStyle.solid,
                          ),
                          Text(
                            '  ${movieDetailsController.movieDetailsModel!.voteAverage} (IMDB)',
                            style: AppTextStyle.bodyMedium
                                .copyWith(color: AppColors.gray600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: AppColors.gray50,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Release date',
                                style: AppTextStyle.labelLarge
                                    .copyWith(color: AppColors.white),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                StringHelper.formatDate(movieDetailsController
                                    .movieDetailsModel!.releaseDate),
                                style: AppTextStyle.bodySmall
                                    .copyWith(color: AppColors.gray500),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Genre',
                                  style: AppTextStyle.labelLarge
                                      .copyWith(color: AppColors.white),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  height: 34,
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.backGroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                  color: AppColors.gray400)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: Text(
                                              movieDetailsController
                                                  .genres[index].name,
                                              style: AppTextStyle.bodyXSmall
                                                  .copyWith(
                                                      color: AppColors.gray500),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          width: 16,
                                        );
                                      },
                                      itemCount:
                                          movieDetailsController.genres.length),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: AppColors.gray50,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Description',
                        style: AppTextStyle.labelLarge
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        movieDetailsController.movieDetailsModel!.overview,
                        style: AppTextStyle.bodyMedium
                            .copyWith(color: AppColors.gray400),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: AppColors.gray50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Cast',
                        style: AppTextStyle.labelLarge
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 88,
                      child: ListView.separated(
                          padding: const EdgeInsets.only(left: 16),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CastCard(
                              avatar: ApiEndPoints.imageUrlSmall +
                                  movieDetailsController
                                      .casts[index].profilePath
                                      .toString(),
                              name: movieDetailsController.casts[index].name,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 16,
                            );
                          },
                          itemCount: movieDetailsController.casts.length),
                    ),
                    const SizedBox(height: 40,)
                  ],
                ),
        ),
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  const CastCard({
    super.key,
    required this.name,
    required this.avatar,
  });

  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: CachedNetworkImage(
              height: 42,
              width: 42,
              imageUrl: avatar,
              progressIndicatorBuilder: (context, url, progress) =>
                  const SizedBox(
                width: 42,
                height: 42,
              ),
              errorWidget: (context, url, error) => Container(
                width: 42,
                height: 42,
                child: HeroIcon(
                  HeroIcons.user,
                  style: HeroIconStyle.solid,
                  color: AppColors.gray400,
                  size: 40,
                ),
              ),
              fadeInCurve: Curves.bounceOut,
              fadeInDuration: const Duration(seconds: 1),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Flexible(
            child: Text(
              name,
              style: AppTextStyle.bodySmall.copyWith(color: AppColors.gray400),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
