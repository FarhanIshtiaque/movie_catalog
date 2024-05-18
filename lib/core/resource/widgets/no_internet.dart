import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:movie_catalog/core/constants/app_assets.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.noInternet, width: screenWidth * .7),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: Text(
                'Check your internet connection',
             //   style: bodyMedium16.copyWith(color: AppColors.gray500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
