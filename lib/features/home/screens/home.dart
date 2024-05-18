import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_catalog/core/constants/app_colors.dart';
import 'package:movie_catalog/features/home/controller%20/home_controller.dart';
import 'package:movie_catalog/features/home/screens/favourite_list.dart';
import 'package:movie_catalog/features/home/screens/movie_list.dart';

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
      body:PageView(
        controller: homeController.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [MovieList(),FavouriteList()],
      ),
      bottomNavigationBar: Obx(
        ()=> CustomNavigationBar(

          iconSize: 30.0,
          isFloating: true,
          selectedColor: AppColors.white,
          strokeColor: AppColors.white,
          unSelectedColor: Colors.white,
          backgroundColor: Colors.black,
          borderRadius: const Radius.circular(30.0),

          //   blurEffect: true,
          // opacity: 0.8,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(IconlyLight.home),
              selectedIcon: const Icon(IconlyBold.home),
              //  title: Text("Home"),
            ),
            CustomNavigationBarItem(
              icon: const Icon(IconlyLight.star),
              selectedIcon: const Icon(IconlyBold.star),
              //  title: Text("Cart"),
            ),

          ],
          currentIndex: homeController.currentIndex.value,
          onTap: (index) {
            homeController.currentIndex(index);
            HapticFeedback.lightImpact();
            homeController.controller.animateToPage(index,
                duration: const Duration(microseconds: 400),
                curve: Curves.easeInOutCubicEmphasized);
            // setState(() {
            //   _currentIndex = index;
            // });
            // HapticFeedback.lightImpact();
            // controller.animateToPage(index,
            //     duration: const Duration(microseconds: 400),
            //     curve: Curves.easeInOutCubicEmphasized);
          },
        ),
      ),
    );
  }
}


