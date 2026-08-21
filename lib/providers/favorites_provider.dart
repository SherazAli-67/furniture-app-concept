import 'package:flutter/material.dart';
import '../core/models/product_model.dart';

class FavoritesProvider extends ChangeNotifier{
  List<ProductModel> favorites = [];
  List<String> get _favoriteProductIds => favorites.map((product) => product.id).toList();

  bool isFavorite(String productID){
    return _favoriteProductIds.contains(productID);
  }

  void toggleFavorites({required ProductModel product}){
    if(_favoriteProductIds.contains(product.id)){
      favorites.removeWhere((item) => item.id == product.id);
    }else{
      favorites.add(product);
    }
    notifyListeners();
  }

}