import 'package:arg_offer/helper/helper.dart';
import 'package:arg_offer/provider/auth_provider.dart';
import 'package:arg_offer/util/custom_text_field.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conPassword = TextEditingController();
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
                  provider.signUp(
                    userName: userName.text,
                    email: email.text,
                    password: password.text,
                    phone: phoneNumber.text,
                    callback: (status, massage) {
                      if (status) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            message: massage,
                          ),
                        );
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message: massage,
                          ),
                        );
                      }
                    },
                  );
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
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/login.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
                        color: Colors.lightBlue,
                        boxShadow: Helper.softUiShadow),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: CustomTextField(
                        borderRadius: 30,
                        fillColor: Colors.white,
                        isShowBorder: true,
                        verticalSize: 15,
                        horizontalSize: 20,
                        hintText: "Username",
                        controller: userName,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'User Name is required';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: CustomTextField(
                        borderRadius: 30,
                        fillColor: Colors.white,
                        isShowBorder: true,
                        verticalSize: 15,
                        horizontalSize: 20,
                        hintText: "Email",
                        controller: email,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: CustomTextField(
                        borderRadius: 30,
                        fillColor: Colors.white,
                        isShowBorder: true,
                        verticalSize: 15,
                        horizontalSize: 20,
                        hintText: "Phone number",
                        controller: phoneNumber,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Phone is required';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: CustomTextField(
                        borderRadius: 30,
                        fillColor: Colors.white,
                        isShowBorder: true,
                        verticalSize: 15,
                        horizontalSize: 20,
                        hintText: "Password",
                        controller: password,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: CustomTextField(
                        borderRadius: 30,
                        fillColor: Colors.white,
                        isShowBorder: true,
                        verticalSize: 15,
                        horizontalSize: 20,
                        hintText: "Confirm password",
                        controller: conPassword,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm password is required';
                          }
                          return null;
                        },
                      )),
                ],
              ),
            ),
          ));
    });
  }
}
