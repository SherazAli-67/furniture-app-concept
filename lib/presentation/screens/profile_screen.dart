import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/app_colors.dart';
import 'package:furniture_app/core/app_icons.dart';
import 'package:furniture_app/core/app_textstyles.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        spacing: 16,
        children: [
          Text("My Profile", style: AppTextStyles.headingTextStyle,),

          Column(
            spacing: 10,
            children: [
              Stack(
                children: [
                  ClipOval(
                    child: Image.asset(AppIcons.devProfileImg, height: 75,),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset(AppIcons.icCamera))
                ],
              ),
              Text("Sheraz Ali", style: AppTextStyles.headingTextStyle.copyWith(color: AppColors.primaryColor, fontSize: 20),),
              Text("soomrosheraz054@gmail.com", style: AppTextStyles.regularTextStyle.copyWith(color: AppColors.primaryColor),)
            ],
          ),
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightWhiteColor,
            ),
            padding: .all(20),
            child: SingleChildScrollView(
              child: Column(
                spacing: 22,
                crossAxisAlignment: .start,
                children: [
                  Text("Account", style: AppTextStyles.btnTextStyle.copyWith(color: AppColors.textGreyColor,  fontWeight: .w600),),
                  Column(
                    spacing: 16,
                    children: [
                      _buildProfileItemWidget(iconColor: AppColors.primaryColor, icon: Icons.delete, title: 'Settings', iconBgColor: AppColors.strokeColor),
                      _buildProfileItemWidget(iconColor: AppColors.cyanAccentColor, icon: Icons.notifications_active_outlined, title: 'Notifications', iconBgColor: AppColors.cyanAccentColor.withValues(alpha: 0.1)),
                      _buildProfileItemWidget(iconColor: AppColors.accentAmberColor, icon: Icons.access_time_filled_rounded, title: 'Older History', iconBgColor: AppColors.accentAmberColor.withValues(alpha: 0.1)),
                    ],
                  ),
              
                  Padding(
                    padding: const .only(top: 20.0),
                    child: Text("Privacy", style: AppTextStyles.btnTextStyle.copyWith(color: AppColors.textGreyColor,  fontWeight: .w600),),
                  ),
                  Column(
                    spacing: 16,
                    children: [
                      _buildProfileItemWidget(iconColor: AppColors.accentBlueColor, icon: Icons.lock, title: 'Privacy Policy', iconBgColor: AppColors.accentBlueColor.withValues(alpha: 0.1)),
                      _buildProfileItemWidget(iconColor: AppColors.yellowColor, icon: Icons.error_outline, title: 'Older History', iconBgColor: AppColors.yellowColor.withValues(alpha: 0.1)),
                      _buildProfileItemWidget(iconColor: AppColors.redColor, icon: Icons.logout, title: 'Logout', iconBgColor: AppColors.redColor.withValues(alpha: 0.1)),
                    ],
                  ),
              
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Row _buildProfileItemWidget({required Color iconBgColor, required IconData icon, required String title, required Color iconColor}) {
    return Row(
      spacing: 18,
      children: [
        Container(
          decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: .circular(7)
          ),
          padding: .all(11),
          child: Icon(icon, color: iconColor,),
        ),
        Text(title, style: AppTextStyles.btnTextStyle.copyWith(
            color: AppColors.primaryColor),),
        const Spacer(),
        Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor,)
      ],
    );
  }
}