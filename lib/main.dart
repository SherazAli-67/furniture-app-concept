import 'package:flutter/material.dart';
import 'package:furniture_app/constants/string_const.dart';
import 'package:furniture_app/core/app_colors.dart';
import 'package:furniture_app/providers/cart_provider.dart';
import 'package:furniture_app/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => CartProvider(), child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightWhiteColor,
        fontFamily: StringConst.appFontFamily,
      ),
      routerConfig: router,
      builder: (ctx, child) => child!,
    );
  }
}