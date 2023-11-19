import 'package:arg_offer/helper/helper.dart';
import 'package:arg_offer/provider/auth_provider.dart';
import 'package:arg_offer/screens/auth/sign_up_Screen.dart';
import 'package:arg_offer/screens/dashboard/dashboard_screen.dart';
import 'package:arg_offer/util/custom_text_field.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColorLight),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                provider.signIn(emailController.text, passwordController.text, (status, massage) {
                  if (status) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
                        message: massage,
                      ),
                    );
                  Helper.toRemoveUntilScreen(context, DashboardScreen());
                  } else {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: massage,
                      ),
                    );
                  }
                });
              }
            },
            child: const Text("login"),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
                      color: AppColors.primaryColorLight,
                      boxShadow: Helper.softUiShadow),
                      child: Center(child: Row(children: [
                        Icon(Icons.checklist,color: Colors.amber,size: 20,)
                      ],)),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: CustomTextField(
                      controller: emailController,
                      validation: (email) {
                        if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email!)) {
                          return null;
                        } else {
                          return 'Please enter a valid email';
                        }
                      },
                      borderRadius: 30,
                      fillColor: Colors.white,
                      isShowBorder: true,
                      verticalSize: 15,
                      horizontalSize: 20,
                      hintText: "Email",
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: CustomTextField(
                      controller: passwordController,
                      validation: (password) {
                        if (password!.isEmpty) {
                          return "please enter your password";
                        } else {
                          return null;
                        }
                      },
                      borderRadius: 30,
                      fillColor: Colors.white,
                      isShowBorder: true,
                      verticalSize: 15,
                      horizontalSize: 20,
                      hintText: "Password",
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Text.rich(TextSpan(
                      text: 'If you dont have account please',
                      style: latoStyle400Regular.copyWith(color: Colors.black45, fontSize: 20),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Helper.toScreen(context, const SignUpScreen());
                            },
                          text: ' Sign Up',
                          style: latoStyle700Bold.copyWith(
                              fontSize: 20, color: AppColors.primaryColorLight),
                        )
                      ])),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
