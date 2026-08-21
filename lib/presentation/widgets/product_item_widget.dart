import 'package:flutter/material.dart';
import 'package:furniture_app/core/app_colors.dart';
import 'package:furniture_app/core/app_textstyles.dart';
import 'package:furniture_app/core/models/product_model.dart';
import 'package:furniture_app/presentation/widgets/product_rating_widget.dart';
import 'package:furniture_app/providers/cart_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../router/app_router.dart';

class ProductItemWidget extends StatelessWidget{
  const ProductItemWidget({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: ()=> context.push(NamedRoutes.productDetail.routeName, extra: product),
      child: Container(
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
                    child: ProductRatingWidget(),),
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
                  child: GestureDetector(onTap: provider.isProductInCart(product.id) ? null : ()=> provider.addItemToCart(product), child: provider.isProductInCart(product.id) ? Icon(Icons.done, color: Colors.white,) : Icon(Icons.add_rounded, color: Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}