import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/app_textstyles.dart';
import 'package:furniture_app/core/models/cart_item_model.dart';
import 'package:furniture_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../core/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> _selectedCheckoutProducts = [];


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Padding(
      padding: .symmetric(horizontal: 10, vertical: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.arrow_back, size: 20, color: AppColors.primaryColor,), style: IconButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: .circular(100),), alignment: .center),),
            Text("Cart", style: AppTextStyles.headingTextStyle.copyWith(color: AppColors.primaryColor),),
            IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.delete, size: 20, color: AppColors.primaryColor,), style: IconButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: .circular(100),), alignment: .center),)
          ],
        ),
        Expanded(child: ListView.separated(itemBuilder: (ctx, index)=> _buildCartItemWidget(provider.cartItems[index]), separatorBuilder: (_, _) => const SizedBox(height: 20,), itemCount: provider.cartItems.length))
      ]),
    );
  }

  Widget _buildCartItemWidget(CartItemModel cartItem){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(12)
      ),
      padding: .symmetric(horizontal: 15, vertical: 8),
      child: Row(
        children: [
          Checkbox(value: _selectedCheckoutProducts.contains(cartItem.id), onChanged: (val) => _toggleSelected(val, cartItem.id), checkColor: Colors.white, fillColor: WidgetStatePropertyAll(_selectedCheckoutProducts.contains(cartItem.id) ? AppColors.primaryColor : Colors.transparent)),
          Expanded(child: Row(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.productBgGreyColor,
                  borderRadius: .circular(12)
                ),
                height: 90,
                width: 100,
                padding: .all(8),
                child: Image.asset(cartItem.product.productImg),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(cartItem.product.title, style: AppTextStyles.btnTextStyle.copyWith(fontWeight: .w600),),
                    Text(cartItem.product.type, style: AppTextStyles.smallTextStyle.copyWith(color: AppColors.unSelectedItemColor),),
                    Row(
                      spacing: 18,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text('\$${cartItem.product.price}', style: AppTextStyles.btnTextStyle.copyWith(fontWeight: .w600),),
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
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  void _toggleSelected(bool? val, String productID) {
    if(_selectedCheckoutProducts.contains(productID)){
      _selectedCheckoutProducts.remove(productID);
    }else{
      _selectedCheckoutProducts.add(productID);
    }
    setState(() {});
  }
}
