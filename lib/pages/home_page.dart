import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/view_models/user_vm.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserVM>(
        builder: (context, value, child) => Center(
          child: Column(
            children: [
              Text(value.myUser.userId),
              Text(value.myUser.userName),
              ElevatedButton(
                  onPressed: () => value.simulateLogout(),
                  child: Text("Log Out"))
            ],
          ),
        ),
      ),
    );
  }
}
