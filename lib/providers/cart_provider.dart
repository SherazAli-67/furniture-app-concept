import 'package:flutter/material.dart';
import '../core/models/cart_item_model.dart';
import '../core/models/product_model.dart';

class CartProvider extends ChangeNotifier{
  List<CartItemModel> cartItems = [];

  List<String> get _cartItemProductIds => cartItems.map((cartItem) => cartItem.product.id).toList();

  CartItemModel? _getCartItemByProductID(String id){
    for (var cartItem in cartItems) {
      if(cartItem.product.id == id){
        return cartItem;
      }
    }
    return null;
  }

  void addItemToCart(ProductModel product){
    if(_cartItemProductIds.contains(product.id)){
      int index = cartItems.indexWhere((cartItem) => cartItem.product.id == product.id);
      CartItemModel cartItem = cartItems[index];
      final updatedCartItem  = cartItem.copyWith(quantity: cartItem.quantity+1);
      cartItems[index] = updatedCartItem;
    }else{
      cartItems.add(CartItemModel(id: DateTime.now().toIso8601String(), product: product, quantity: 1));
    }
    notifyListeners();
  }

  String getTotalPrice(){
   double total = 0;
   for (var item in cartItems) {
     total += item.quantity * item.product.price;
   }
   return '\$${total.toStringAsFixed(2)}';
  }

  void onDecreaseQuantityTap({required String productID}){
    CartItemModel? cartItem = _getCartItemByProductID(productID);
    if(cartItem != null){
      if(cartItem.quantity == 1){
        return;
      }
      int index = cartItems.indexWhere((item)=> item.id == cartItem.id);
      CartItemModel updatedCartItem = cartItem.copyWith(quantity: cartItem.quantity-1);
      cartItems[index] = updatedCartItem;
      notifyListeners();
    }
  }

  int getCartItemQuantityByPlanID(String id) {
    if(_cartItemProductIds.contains(id)){
      CartItemModel cartItem = _getCartItemByProductID(id)!;
      return cartItem.quantity;
    }else{
      return 0;
    }
  }

  String getFormattedCartItemQuantityByPlanID(String id) {
    if(_cartItemProductIds.contains(id)){
      CartItemModel cartItem = _getCartItemByProductID(id)!;
      return cartItem.quantity < 10 ? '0${cartItem.quantity}' : cartItem.quantity.toString();
    }else{
      return '00';
    }
  }

  bool isProductInCart(String productID){
    return _cartItemProductIds.contains(productID);
  }
}