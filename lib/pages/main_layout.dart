import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/view_models/default_layout_vm.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DefaultLayoutVM>(
      builder: (context, defaultLayout, child) => Scaffold(
        body: defaultLayout.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notification"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settigs"),
          ],
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          currentIndex: defaultLayout.selectPageIndex,
          onTap: (index) => defaultLayout.selectBottomNavigator(index),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Consumer<DefaultLayoutVM>(
      builder: (context, value, child) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settigs"),
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        currentIndex: value.selectPageIndex,
        onTap: (index) => value.selectBottomNavigator(index),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
