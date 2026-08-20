import 'package:flutter/material.dart';
import 'package:furniture_app/core/app_colors.dart';
import 'package:furniture_app/core/app_textstyles.dart';
import 'package:furniture_app/core/models/product_model.dart';

class ProductItemWidget extends StatelessWidget{
  const ProductItemWidget({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(12)
      ),
      width: 150,
      alignment: .center,
      padding: .all(8),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 11,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.productBgGreyColor,
                borderRadius: .circular(12)
            ),
            child: Stack(
              children: [
                Padding(
                    padding: .symmetric(horizontal: 20, vertical: 10),
                    child: Hero(
                        tag: product.id,
                        child: Image.asset(product.productImg, height: 100,width: 145,))),

                if(product.isNew)
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: Container(
                        decoration: BoxDecoration(color: Colors.red, borderRadius: .circular(99)),
                        padding: .symmetric(horizontal: 5, vertical: 2.5),
                        child: Text('New', style: AppTextStyles.smallTextStyle.copyWith(fontSize: 10, color: Colors.white),)),),

                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                      decoration: BoxDecoration(color: AppColors.ratingBgColor, borderRadius: .circular(99)),
                      padding: .symmetric(horizontal: 5, vertical: 2.5),
                      child: Row(
                        spacing: 3,
                        children: [
                          Icon(Icons.star_rate_rounded, color: AppColors.ratingAmberColor, size: 10,),
                          Text('4.8', style: AppTextStyles.smallTextStyle.copyWith(fontSize: 10, color: AppColors.ratingAmberColor),)
                        ],
                      )
                  ),),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(product.title, style: AppTextStyles.btnTextStyle.copyWith(fontWeight: .w600),),
              Text(product.type, style: AppTextStyles.smallTextStyle.copyWith(color: AppColors.unSelectedItemColor),)
            ],
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('\$${product.price}', style: AppTextStyles.btnTextStyle.copyWith(fontWeight: .w600),),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: .circle
                ),
                padding: .all(5),
                child: GestureDetector(onTap: (){}, child: Icon(Icons.add_rounded, color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }
}