import 'product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel product;
  final int quantity;
  CartItemModel({required this.id, required this.product, required this.quantity});



  CartItemModel copyWith({
    String? id,
    int? quantity,
  }) {

    return CartItemModel(
      id: id ?? this.id,
      product: product,
      quantity: quantity ?? this.quantity,
    );

  }
}