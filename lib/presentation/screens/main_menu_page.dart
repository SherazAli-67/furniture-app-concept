import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_colors.dart';
import '../../core/app_icons.dart';
import '../../core/app_textstyles.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: .fixed,
            backgroundColor: Colors.white,
            onTap: (index)=> navigationShell.goBranch(index),
            selectedItemColor: Colors.black,
            currentIndex: navigationShell.currentIndex,
            unselectedItemColor: AppColors.unSelectedItemColor,
            unselectedLabelStyle: AppTextStyles.regularTextStyle.copyWith(color: AppColors.unSelectedItemColor, fontSize: 12),
            selectedLabelStyle: AppTextStyles.regularTextStyle.copyWith(color: AppColors.primaryColor, fontSize: 12),
            items: [
              _buildBottomNavigationBarItemWidget(icon: AppIcons.icNotifications, label: 'Notifications', index: 0),
              _buildBottomNavigationBarItemWidget(icon: AppIcons.icFavorite, label: 'Favorite', index: 1),
              _buildBottomNavigationBarItemWidget(icon: navigationShell.currentIndex ==2 ? AppIcons.icHomeSelected : AppIcons.icHome, label: 'Home', index: 2),
              _buildBottomNavigationBarItemWidget(icon: AppIcons.icCart, label: 'Cart', index: 3),
              _buildBottomNavigationBarItemWidget(icon:navigationShell.currentIndex ==4 ? AppIcons.icProfileSelected : AppIcons.icProfile , label: 'Profile', index: 4),

            ]),
        body: SafeArea(child: navigationShell)
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItemWidget(
      {required String icon, required String label, required int index}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(icon, height: 24, width: 24,), label: label,);

}