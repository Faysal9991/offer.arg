import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {

  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
         Provider.of<HomePageProvider>(context, listen: false).getBalance();
      });
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<HomePageProvider>(
      builder: (context, provider,child) {
        return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          color: AppColors.primaryColorLight),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(-10, -10),
                                      blurRadius: 16.0,
                                      spreadRadius: 1),
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(4.0, 4.0),
                                      blurRadius: 16.0,
                                      spreadRadius: 1),
                                ],
                                color: const Color(0xFFEFEEEE),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "assets/icon/person.svg",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(-10, -10),
                                      blurRadius: 16.0,
                                      spreadRadius: 1),
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(4.0, 4.0),
                                      blurRadius: 16.0,
                                      spreadRadius: 1),
                                ],
                                color: const Color(0xFFEFEEEE),
                              ),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Balance:",
                                        style: latoStyle700Bold,
                                      ),
                                      Text(
                                        "${provider.balance.totalDeposit}",
                                        style: latoStyle700Bold,
                                      )
                                    ],
                                  )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(-10, -10),
                                      blurRadius: 16.0,
                                      spreadRadius: 1),
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(4.0, 4.0),
                                      blurRadius: 16.0,
                                      spreadRadius: 1),
                                ],
                                color: const Color(0xFFEFEEEE),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  "assets/icon/menu.svg",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   ],
                );
      }
    );
           
  }
}