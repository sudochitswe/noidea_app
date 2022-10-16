import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/helper.dart';
import '../models/result_status.dart';
import '../view_models/user_vm.dart';

class UserSignUpPage extends StatefulWidget {
  static String routeName = '/signUp';
  const UserSignUpPage({Key? key}) : super(key: key);

  @override
  State<UserSignUpPage> createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  String? _email, _password;
  void _SignUpButtonSubmit(String email, String password) async {
    var userPvd = Provider.of<UserVM>(context, listen: false);
    if (email != "" || password != "") {
      ResultStatus res =
          await userPvd.pocketBaseAdminEmailLogin(_email!, _password!);
      if (!res.status) {
        showAlertDialog(context, "Error", res.message);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Fill all blank Text Field!.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _key,
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 32.0, right: 16.0, left: 16.0),
                  child: Text(
                    'Sign In',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                // UserImagePicker(_pickedImage, ""),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                  child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.next,
                      onSaved: (String? val) {
                        _email = val;
                      },
                      style: const TextStyle(fontSize: 18.0),
                      keyboardType: TextInputType.emailAddress,
                      decoration: getInputDecoration(
                          hint: 'Email Address',
                          darkMode: isDarkMode(context),
                          errorColor: Theme.of(context).errorColor)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                  child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      obscureText: true,
                      validator: validatePassword,
                      onSaved: (String? val) {
                        _password = val;
                      },
                      onFieldSubmitted: (password) => {},
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(fontSize: 18.0),
                      decoration: getInputDecoration(
                          hint: 'Password',
                          darkMode: isDarkMode(context),
                          errorColor: Theme.of(context).errorColor)),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: getElevatedButtonStyle(context),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () => {
                          _key.currentState?.save(),
                          _SignUpButtonSubmit(_email!, _password!)
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, right: 24),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Already have an account ?',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10),
                //   child: Row(
                //     children: [
                //       OutlinedButton.icon(
                //         style: OutlinedButton.styleFrom(
                //           padding: const EdgeInsets.all(12),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           primary: const Color.fromRGBO(103, 58, 183, 1),
                //         ),
                //         onPressed: () => {
                //           _key.currentState?.save(),
                //           _loginButtonSubmit(_email!, _password!)
                //         },
                //         icon: Icon(Icons.phone_iphone_outlined),
                //         label: Text("Sign up with phone"),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       OutlinedButton.icon(
                //         style: OutlinedButton.styleFrom(
                //           padding: const EdgeInsets.all(12),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           primary: const Color.fromRGBO(103, 58, 183, 1),
                //         ),
                //         onPressed: () => {},
                //         icon: Icon(Icons.facebook),
                //         label: Text("Login with Facebook"),
                //       ),
                //     ],
                //   ),
                // )
                // Padding(
                //   padding: const EdgeInsets.only(
                //       right: 40.0, left: 40.0, bottom: 20),
                //   child: ElevatedButton.icon(
                //     label: const Text(
                //       'Facebook Login',
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white),
                //     ),
                //     icon: Image.asset(
                //       'assets/images/facebook_logo.png',
                //       color: Colors.white,
                //       height: 24,
                //       width: 24,
                //     ),
                //     style: ElevatedButton.styleFrom(
                //       padding: const EdgeInsets.symmetric(vertical: 12),
                //       primary: const Color(FACEBOOK_BUTTON_COLOR),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(25.0),
                //         side: const BorderSide(
                //           color: Color(FACEBOOK_BUTTON_COLOR),
                //         ),
                //       ),
                //     ),
                //     onPressed: () {
                //       context.read<LoadingCubit>().showLoading(
                //           context, 'Logging in, Please wait...', false);
                //       context.read<AuthenticationBloc>().add(
                //             LoginWithFacebookEvent(),
                //           );
                //     },
                //   ),
                // ),
                // FutureBuilder<bool>(
                //   future: apple.TheAppleSignIn.isAvailable(),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState ==
                //         ConnectionState.waiting) {
                //       return const CircularProgressIndicator.adaptive();
                //     }
                //     if (!snapshot.hasData || (snapshot.data != true)) {
                //       return Container();
                //     } else {
                //       return Padding(
                //         padding: const EdgeInsets.only(
                //             right: 40.0, left: 40.0, bottom: 20),
                //         child: apple.AppleSignInButton(
                //             cornerRadius: 25.0,
                //             type: apple.ButtonType.signIn,
                //             style: isDarkMode(context)
                //                 ? apple.ButtonStyle.white
                //                 : apple.ButtonStyle.black,
                //             onPressed: () {
                //               context.read<LoadingCubit>().showLoading(
                //                   context,
                //                   'Logging in, Please wait...',
                //                   false);
                //               context.read<AuthenticationBloc>().add(
                //                     LoginWithAppleEvent(),
                //                   );
                //             }),
                //       );
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
