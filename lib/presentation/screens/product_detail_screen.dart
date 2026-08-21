import 'package:flutter/material.dart';
import 'package:furniture_app/constants/string_const.dart';
import 'package:furniture_app/core/app_data.dart';
import 'package:furniture_app/core/app_textstyles.dart';
import 'package:furniture_app/core/models/product_model.dart';
import 'package:furniture_app/presentation/widgets/product_rating_widget.dart';

import '../../core/app_colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 30,
        children: [
          Expanded(child: Container(
              decoration: BoxDecoration(
                  color: AppColors.productBgGreyColor,
                  borderRadius: .circular(12)
              ),
              padding: .only(top: 60),
              width: .infinity,
              child: Hero(tag: product.id, child: Image.asset(product.productImg, ),)),),

          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 13,
                        crossAxisAlignment: .start,
                        children: [
                          Text(product.title, style: AppTextStyles.headingTextStyle.copyWith(fontSize: 20, color: AppColors.primaryColor),),
                          Text(product.type, style: AppTextStyles.regularTextStyle.copyWith(color: AppColors.textGreyColor, fontSize: 18),)
                        ],
                      ),
                    ),
                    ProductRatingWidget()
                  ],
                ),
                Text(StringConst.productDescription, style: AppTextStyles.regularTextStyle.copyWith(color: AppColors.textGreyColor),),
                Row(
                  spacing: 8,
                  children: AppData.productCushions.map((product){
                    return ClipRRect(
                        borderRadius: .circular(10),
                        child: Image.asset(product, height: 50, width: 50));
                  }).toList()
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
