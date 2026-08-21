import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier{
  int selectedTabIndex = 0;

  void onTabTap(int index){
    selectedTabIndex = index;
    notifyListeners();
  }
}
