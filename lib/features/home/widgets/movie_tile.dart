

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalog/core/constants/api_endpoints.dart';
import 'package:movie_catalog/core/constants/app_colors.dart';
import 'package:movie_catalog/core/constants/text_styles.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({super.key, this.onTap, required this.url, required this.title});

  final String url;
  final String title;
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
                imageUrl: ApiEndPoints.imageUrl + url,
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
            title,
            style: AppTextStyle.labelSmall.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}