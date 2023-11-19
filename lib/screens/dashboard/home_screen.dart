import 'package:arg_offer/helper/helper.dart';
import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/screens/dashboard/widget/airtel.dart';
import 'package:arg_offer/screens/dashboard/widget/banglalink.dart';
import 'package:arg_offer/screens/dashboard/widget/gramen.dart';
import 'package:arg_offer/screens/dashboard/widget/robi.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> simName = [
    "Airtel",
    "Grameenphone",
    "Banglalink",
    " Robi",
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomePageProvider>(context, listen: false).getOffer(SimName.Airtel.name);
      Provider.of<HomePageProvider>(context, listen: false).getBalance();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
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
                                    "Balance: ",
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 160, left: 10, right: 10),
                    child: SizedBox(
                        height: 95,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => const SizedBox(
                                  width: 5,
                                ),
                            itemCount: simName.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      provider.getOffer(simName[index]);
                                      provider.changeIndex(index);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: provider.index == index
                                              ? AppColors.primaryColorLight
                                              : Colors.white,
                                          border: Border.all(color: AppColors.secondaryColorLight),
                                          boxShadow: Helper.downShadow),
                                      child: Center(
                                          child: Text(
                                        simName[index],
                                        style: latoStyle700Bold.copyWith(
                                            color: provider.index == index
                                                ? Colors.white
                                                : Colors.black),
                                      )),
                                    ),
                                  ),
                                ],
                              );
                            })),
                  ),
                )
              ],
            ),
            provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : provider.index == 0
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: airtelOffer(provider, () {}),
                      )
                    : provider.index == 1
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: grameenPhoneOffer(provider, () {}),
                          )
                        : provider.index == 2
                            ? Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: banglalinkOffer(provider, () {}),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: robiOffer(provider, () {}),
                              )
          ]),
        ),
      );
    });
  }
}
