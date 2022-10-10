import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/pages/app_config_page.dart';
import 'package:flutter_complete_guide/pages/notification_page.dart';

import '../pages/home_page.dart';

class DefaultLayoutVM extends ChangeNotifier {
  int _selectedPageIndex = 0;
  int get selectPageIndex => _selectedPageIndex;
  Widget currentPage = HomePage();
  void selectBottomNavigator(int selectedIndex) {
    _selectedPageIndex = selectedIndex;
    switch (selectedIndex) {
      case 0:
        currentPage = const HomePage();
        break;
      case 1:
        currentPage = NotificationPage();
        break;
      case 2:
        currentPage = const AppConfigPage();
        break;
    }
    notifyListeners();
  }
}
