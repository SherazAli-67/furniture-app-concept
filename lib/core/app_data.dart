import 'package:furniture_app/core/app_icons.dart';
import 'package:furniture_app/core/models/product_model.dart';

class AppData {
  static List<String> get categories => [
    'Chairs', 'Cupboards', 'Tables', 'Lamps',
  ];

  static List<ProductModel> get homeProducts => [
    ProductModel(id: 'Home1', title: "Modern Chair", price: 125.5, isNew: true, type: 'Arm Chair', productImg: AppIcons.modernChair),
    ProductModel(id: 'Home2', title: "Minimalist Chair", price: 299.9, isNew: true, type: 'Arm Chair', productImg: AppIcons.minimalistChair),
    ProductModel(id: 'Home3', title: "Modern Chair", productImg: AppIcons.brownChair, price: 99.9, isNew: true, type: 'Arm Chair'),
    ProductModel(id: 'Home4', title: "Yellow Chair", productImg: AppIcons.yellowChair, price: 99.9, isNew: true, type: 'Arm Chair'),
  ];

  static List<ProductModel> get bestSellerProducts => [
    ProductModel(id: 'BestSeller1', title: "Yellow Chair", productImg: AppIcons.yellowChair, price: 99.9, isNew: true, type: 'Arm Chair'),
    ProductModel(id: 'BestSeller2', title: "Brown Chair", price: 125.5, isNew: true, type: 'Arm Chair', productImg: AppIcons.modernChair),
    ProductModel(id: 'BestSeller3', title: "Minimalist Chair", price: 299.9, isNew: true, type: 'Arm Chair', productImg: AppIcons.minimalistChair),
    ProductModel(id: 'BestSeller4', title: "Modern Chair", productImg: AppIcons.brownChair, price: 99.9, isNew: true, type: 'Arm Chair'),

  ];
}