import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/user_vm.dart';

class AppConfigPage extends StatelessWidget {
  const AppConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Config Page"),
        Consumer<UserVM>(
          builder: (context, value, child) => Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => value.simulateLogout(),
                    child: Text("Log Out"))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
