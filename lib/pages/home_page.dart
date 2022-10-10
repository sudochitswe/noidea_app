import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/user_vm.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(),
      ),
      body: Center(child: Text("Home")),
    );
  }
}
