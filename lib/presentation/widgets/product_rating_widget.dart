import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_textstyles.dart';

class ProductRatingWidget extends StatelessWidget{
  const ProductRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: AppColors.ratingBgColor, borderRadius: .circular(99)),
        padding: .symmetric(horizontal: 5, vertical: 2.5),
        child: Row(
          spacing: 3,
          children: [
            Icon(Icons.star_rate_rounded, color: AppColors.ratingAmberColor, size: 10,),
            Text('4.8', style: AppTextStyles.smallTextStyle.copyWith(fontSize: 10, color: AppColors.ratingAmberColor),)
          ],
        )
    );
  }
}