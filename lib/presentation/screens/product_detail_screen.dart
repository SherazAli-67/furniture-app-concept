import 'package:flutter/material.dart';
import 'package:furniture_app/constants/string_const.dart';
import 'package:furniture_app/core/app_data.dart';
import 'package:furniture_app/core/app_textstyles.dart';
import 'package:furniture_app/core/models/product_model.dart';
import 'package:furniture_app/presentation/widgets/primary_btn.dart';
import 'package:furniture_app/presentation/widgets/product_rating_widget.dart';
import 'package:furniture_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../core/app_colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
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
            padding: const .all(30),
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
                ),
                Row(
                  children: [
                    Expanded(child: Row(
                      spacing: 16,
                      children: [
                        Text("Color", style: AppTextStyles.btnTextStyle,),
                        Row(
                          spacing: 12,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: .circle,
                                border: .all(color: AppColors.blueGreyColor, width: 2)
                              ),
                              padding: .all(5),
                              child: _buildColorWidget(color:  AppColors.blueGreyColor),
                            ),
                            _buildColorWidget(color: AppColors.brownColor),
                            _buildColorWidget(color: AppColors.redColor)
                          ],
                        )
                      ],
                    )),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: .circular(99),
                        color: AppColors.unSelectedItemColor
                      ),
                      padding: .all(2),
                      child: Row(
                        spacing: 8,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: Colors.white
                            ),
                            child: Icon(Icons.add_rounded, color: AppColors.primaryColor, size: 15,),
                          ),
                          Text('1', style: AppTextStyles.smallTextStyle.copyWith(color: AppColors.primaryColor, fontWeight: .bold),),
                          Container(
                            decoration: BoxDecoration(
                                shape: .circle,
                                color: Colors.white
                            ),
                            child: Icon(Icons.remove, color: AppColors.primaryColor, size: 15,),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: .infinity,
                  child: PrimaryBtn(btnText: provider.isProductInCart(product.id) ? "Already in cart" : "Add to cart"),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildColorWidget({required Color color}) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
          shape: .circle,
          color: color
      ),
    );
  }
}
