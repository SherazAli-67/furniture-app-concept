import 'package:flutter/material.dart';
import 'package:furniture_app/core/app_colors.dart';
import 'package:furniture_app/core/app_icons.dart';
import 'package:furniture_app/core/app_textstyles.dart';
import '../widgets/primary_btn.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Expanded(child: Image.asset(AppIcons.onboardingImg, fit: .cover,)),
          SafeArea(
            child: Padding(
              padding: const .symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 17,
                children: [
                  Text("Enjoy Your Online Shopping", style: AppTextStyles.headingTextStyle.copyWith(color: AppColors.primaryColor),),
                  Text("Browser through all categories and shop the best furniture for your dream house", style: AppTextStyles.regularTextStyle.copyWith(color: AppColors.textGreyColor),),
                  SizedBox(
                    width: .infinity,
                    child: PrimaryBtn(btnText: 'Get Started',),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}