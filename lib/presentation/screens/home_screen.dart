import 'package:flutter/material.dart';
import 'package:furniture_app/core/app_colors.dart';
import 'package:furniture_app/core/app_icons.dart';
import 'package:furniture_app/core/app_textstyles.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: .symmetric(horizontal: 25, vertical: 30), child: Column(
      children: [
        Row(
          children: [
            Expanded(child: Text("Discover The Best Furniture", style: AppTextStyles.headingTextStyle.copyWith(color: AppColors.primaryColor),)),
            ClipOval(
              child: Image.asset(AppIcons.devProfileImg, height: 45,),
            )
          ],
        )
      ],
    )
    );
  }
}