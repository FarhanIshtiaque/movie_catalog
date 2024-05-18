import 'package:flutter/material.dart';
import 'package:movie_catalog/core/constants/app_colors.dart';
import 'package:movie_catalog/core/constants/app_values.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.buttonNameWidget,
    this.large = true,
    this.color = AppColors.black, this.isRounded = false,
  });
  final VoidCallback? onPressed;

  final Widget buttonNameWidget;
  final bool large;
  final Color? color;
  final bool isRounded;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: AppColors.gray200,
      color: color,
      splashColor: AppColors.white.withOpacity(.2),
      elevation: 0,
      height: large ? 56 : 36,
      minWidth: double.infinity,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius:isRounded? BorderRadius.circular(100) :BorderRadius.circular(AppValues.buttonRadius)),
      child: buttonNameWidget,
    );
  }
}
