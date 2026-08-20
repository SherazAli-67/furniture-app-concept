import 'package:furniture_app/core/app_icons.dart';
import 'package:furniture_app/core/models/product_model.dart';

class AppData {
  static List<String> get categories => [
    'Chairs', 'Cupboards', 'Tables', 'Lamps',
  ];

  static List<ProductModel> get homeProducts => [
    ProductModel(id: '1', title: "Modern Chair", price: 125.5, isNew: true, type: 'Arm Chair', productImg: AppIcons.modernChair),
    ProductModel(id: '2', title: "Minimalist Chair", price: 299.9, isNew: true, type: 'Arm Chair', productImg: AppIcons.minimalistChair),
    ProductModel(id: '3', title: "Modern Chair", productImg: AppIcons.brownChair, price: 99.9, isNew: true, type: 'Arm Chair'),
    ProductModel(id: '4', title: "Yellow Chair", productImg: AppIcons.yellowChair, price: 99.9, isNew: true, type: 'Arm Chair'),
  ];
}