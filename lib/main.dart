import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/pages/login_page.dart';
import 'package:flutter_complete_guide/pages/main_layout.dart';
import 'package:flutter_complete_guide/pages/user_signup_page.dart';
import 'package:flutter_complete_guide/view_models/default_layout_vm.dart';
import 'package:flutter_complete_guide/view_models/user_vm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserVM(),
        ),
        ChangeNotifierProvider(
          create: (context) => DefaultLayoutVM(),
        )
      ],
      child: Consumer<UserVM>(
        builder: (context, userData, child) => MaterialApp(
          title: 'MyPay',
          // theme: ThemeData.light(),
          theme: ThemeData(
            // brightness: Brightness.dark,
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(255, 229, 18, 1),
              primary: Color.fromRGBO(255, 229, 18, 1),
              secondary: Color.fromRGBO(0, 145, 210, 1),
            ),
            // primarySwatch: Colors.amber,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          home: userData.isAuth ? const MainLayout() : LoginPage(),
          routes: {
            UserSignUpPage.routeName: (context) => UserSignUpPage(),
          },
        ),
      ),
    );
  }
}

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


