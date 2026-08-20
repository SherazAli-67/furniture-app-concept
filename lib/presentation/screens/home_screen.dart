import 'package:flutter/material.dart';
import 'package:furniture_app/core/app_colors.dart';
import 'package:furniture_app/core/app_data.dart';
import 'package:furniture_app/core/app_icons.dart';
import 'package:furniture_app/core/app_textstyles.dart';
import 'package:furniture_app/presentation/widgets/product_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 25, vertical: 30),
      child: Column(
        spacing: 24,
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Expanded(child: Text("Discover The Best Furniture", style: AppTextStyles.headingTextStyle.copyWith(color: AppColors.primaryColor,),),),
              ClipOval(child: Image.asset(AppIcons.devProfileImg, height: 45)),
            ],
          ),
          _buildSearchWidget(),
          Column(
            spacing: 16,
            crossAxisAlignment: .start,
            children: [
              SizedBox(
                height: 35,
                child: ListView.separated(
                    scrollDirection: .horizontal,
                    itemBuilder: (ctx, index)=> _buildCategoryItemWidget(category: AppData.categories[index]), separatorBuilder: (ctx, index) => const SizedBox(width: 10,), itemCount: AppData.categories.length),
              ),
              SizedBox(
                height: 240,
                width: .infinity,
                child: ListView.separated(
                    scrollDirection: .horizontal,
                    itemBuilder: (ctx, index)=> ProductItemWidget(product: AppData.homeProducts[index],), separatorBuilder: (ctx, index) => const SizedBox(width: 21,), itemCount: AppData.homeProducts.length),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSearchWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(99),
        border: .all(color: AppColors.strokeColor)
      ),
      // padding: .symmetric(horizontal: 20),
      child: IntrinsicHeight(
        child: Row(
          spacing: 10,
          children: [
            Expanded(child: TextField(
              decoration: InputDecoration(
                enabledBorder: .none,
                focusedBorder: .none,
                hintText: "Search for furniture",
                hintStyle: AppTextStyles.regularTextStyle.copyWith(fontSize: 12),
                prefixIcon: Icon(Icons.search_rounded, color: AppColors.primaryColor,),
                alignLabelWithHint: true
              ),
            )),
            Padding(padding: .only(right: 20), child: Row(
              children: [
                VerticalDivider(),
                Icon(Icons.filter_list, color: AppColors.primaryColor,)
              ],
            ),)
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItemWidget({required String category}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(99),
        color: AppColors.categoryBgColor
      ),
      padding: .symmetric(horizontal: 21, vertical: 8),
      child: Text(category, style: AppTextStyles.btnTextStyle.copyWith(fontSize: 16, fontWeight: .w600, color: AppColors.primaryColor),),
    );
  }
}
