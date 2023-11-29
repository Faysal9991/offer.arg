import 'package:arg_offer/helper/helper.dart';
import 'package:arg_offer/provider/auth_provider.dart';
import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/screens/dashboard/widget/airtel.dart';
import 'package:arg_offer/screens/landing_screen.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController number = TextEditingController();
  TextEditingController division = TextEditingController();
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
      Provider.of<HomePageProvider>(context, listen: false).getSupport();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, provider, child) {
      return provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
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
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context).viewInsets.bottom),
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Wrap(
                                                children: [
                                                  SizedBox(
                                                      height: 100,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            width: double.infinity,
                                                            child: ElevatedButton(
                                                                onPressed: () {
                                                                  Provider.of<AuthProvider>(context,
                                                                          listen: false)
                                                                      .logout()
                                                                      .then((value) {
                                                                    Helper.toRemoveUntilScreen(
                                                                        context,
                                                                        const LandingScreen());
                                                                  });
                                                                },
                                                                child: const Text("Logout")),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icon/person.svg",
                                      height: 50,
                                      width: 50,
                                    ),
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
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 15, right: 15, bottom: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Balance: ",
                                          style: latoStyle700Bold,
                                        ),
                                        Text(
                                          provider.balance.balance ?? "0",
                                          style: latoStyle700Bold,
                                        )
                                      ],
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context).viewInsets.bottom),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Wrap(
                                            children: [
                                              SizedBox(
                                                height: 300,
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Contact us",
                                                        style: latoStyle700Bold,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Mail Support (24/7)",
                                                            style: latoStyle700Bold,
                                                          ),
                                                          const SizedBox(height: 10),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              launchUrl(Uri(
                                                                path: provider.supportModel
                                                                    .supports!.suppertMail,
                                                              ));
                                                            },
                                                            child: Text(
                                                              provider.supportModel.supports!
                                                                  .suppertMail
                                                                  .toString(),
                                                              style: latoStyle700Bold.copyWith(
                                                                  color: Colors.green),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "For your Support (14/6)",
                                                            style: latoStyle700Bold,
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Text(
                                                            provider.supportModel.supports!
                                                                .suppertNumber
                                                                .toString(),
                                                            style: latoStyle700Bold.copyWith(
                                                                color: Colors.green),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Social Support",
                                                            style: latoStyle700Bold,
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Column(
                                                            children: [
                                                              ElevatedButton(
                                                                onPressed:(){
                                                                  launchUrl(Uri.parse(provider.supportModel.supports!.fbpage.toString())); 
                                                                },
                                                                child: Text(
                                                                  "Facebook",
                                                                  style: latoStyle700Bold.copyWith(
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(width: 15),
                                                              ElevatedButton(
                                                                onPressed:(){
launchUrl(Uri.parse(provider.supportModel.supports!.telegramChannel.toString()));    
                                                                },
                                                                  // Clipboard.setData(ClipboardData(text:provider.supportModel.supports!.telegramChannel.toString()));},
                                                                child: Text(
                                                                  "Join Telegram Channel",
                                                                  style: latoStyle700Bold.copyWith(
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(width: 15),
                                                              ElevatedButton(
                                                                onPressed:(){
                                                                  var whatsappUrl ="whatsapp://send?phone=01746664004";
launchUrl(Uri.parse(whatsappUrl));         
                                                                },
                                                                child: Text(
                                                                  "Whats app",
                                                                  style: latoStyle700Bold.copyWith(color: Colors.white)
                                                                ),
                                                              ),
                                                              const SizedBox(width: 15),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
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
                                  child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.support_agent,
                                        size: 30,
                                      )),
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
                                                border: Border.all(
                                                    color: AppColors.secondaryColorLight),
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
                      ? const Center(child: CircularProgressIndicator())
                      : provider.index == 0
                          ? Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: provider.airtel.length,
                                  itemBuilder: (context, index) {
                                    return ListCardItem(
                                      discount: provider.airtel[index].discount.toString(),
                                      title: provider.airtel[index].title.toString(),
                                      offer: provider.airtel[index].offerPrice.toString(),
                                      regularOffer: provider.airtel[index].ragularPrice.toString(),
                                      image: "assets/airtel.png",
                                      myad: provider.airtel[index].meyad.toString(),
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                                              child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Wrap(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "* শুধুমাত্র প্রিপেইড অপারেটর অফারটি নিতে পারবে এবং আপনি যদি আপনার ভুল নম্বর প্রবেশ করান তবে এটির জন্য আমরা দায়ি থাকব না ।",
                                                        style: latoStyle700Bold,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        provider.airtel[index].location.toString(),
                                                        style: latoStyle700Bold,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Buy At ${provider.airtel[index].offerPrice.toString()}",
                                                        style: latoStyle700Bold.copyWith(
                                                            color: Colors.green),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Your account balance:  ${provider.balance.balance}BDT",
                                                        style: latoStyle700Bold.copyWith(
                                                            color: Colors.black26),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        keyboardType: TextInputType.number,
                                                        controller: number,
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(25.0),
                                                            borderSide: const BorderSide(
                                                              color: Colors.red,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          label: const Text("* ১১ ডিজিটের নাম্বার"),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        controller: division,
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(25.0),
                                                            borderSide: const BorderSide(
                                                              color: Colors.red,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          label: const Text(
                                                              "* নাম্বারটি কোন বিভাগের ?"),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  AppColors.primaryColorLight),
                                                          onPressed: () {
                                                            if (number.text.length == 11 &&
                                                                division.text.isNotEmpty) {
                                                              provider.buyOffer(
                                                                  id: provider.airtel[index].id
                                                                      .toString(),
                                                                  phoneNumber: number.text,
                                                                  division: division.text,
                                                                  callback: (value) {
                                                                    showTopSnackBar(
                                                                      Overlay.of(context),
                                                                      CustomSnackBar.info(
                                                                        message: value,
                                                                      ),
                                                                    );
                                                                  });
                                                            } else {
                                                              showTopSnackBar(
                                                                Overlay.of(context),
                                                                const CustomSnackBar.error(
                                                                  message:
                                                                      "please input correct number & Divison name",
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          child: const Text("Buy Now")),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  }),
                            )
                          : provider.index == 1
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: provider.grameenphone.length,
                                      itemBuilder: (context, index) {
                                        return ListCardItem(
                                          title: provider.grameenphone[index].title.toString(),
                                          discount:
                                              provider.grameenphone[index].discount.toString(),
                                          offer: provider.grameenphone[index].offerPrice.toString(),
                                          regularOffer:
                                              provider.grameenphone[index].ragularPrice.toString(),
                                          image: 'assets/gramine.png',
                                          myad: provider.grameenphone[index].meyad.toString(),
                                          onTap: () {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context).viewInsets.bottom),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: Wrap(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            "* শুধুমাত্র প্রিপেইড অপারেটর অফারটি নিতে পারবে এবং আপনি যদি আপনার ভুল নম্বর প্রবেশ করান তবে এটির জন্য আমরা দায়ি থাকব না ।",
                                                            style: latoStyle700Bold,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            provider.grameenphone[index].location
                                                                .toString(),
                                                            style: latoStyle700Bold,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            "Buy At ${provider.grameenphone[index].offerPrice.toString()}",
                                                            style: latoStyle700Bold.copyWith(
                                                                color: Colors.green),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            "Your account balance:  ${provider.balance.balance}BDT",
                                                            style: latoStyle700Bold.copyWith(
                                                                color: Colors.black26),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: TextFormField(
                                                            keyboardType: TextInputType.number,
                                                            controller: number,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(25.0),
                                                                borderSide: const BorderSide(
                                                                  color: Colors.red,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              label: const Text(
                                                                  "* ১১ ডিজিটের নাম্বার"),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: TextFormField(
                                                            controller: division,
                                                            decoration: InputDecoration(
                                                              border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(25.0),
                                                                borderSide: const BorderSide(
                                                                  color: Colors.red,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              label: const Text(
                                                                  "* নাম্বারটি কোন বিভাগের ?"),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: double.infinity,
                                                          child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      AppColors.primaryColorLight),
                                                              onPressed: () {
                                                                if (number.text.length == 11 &&
                                                                    division.text.isNotEmpty) {
                                                                  provider.buyOffer(
                                                                      id: provider
                                                                          .grameenphone[index].id
                                                                          .toString(),
                                                                      phoneNumber: number.text,
                                                                      division: division.text,
                                                                      callback: (value) {
                                                                        showTopSnackBar(
                                                                          Overlay.of(context),
                                                                          CustomSnackBar.info(
                                                                            message: value,
                                                                          ),
                                                                        );
                                                                      });
                                                                } else {
                                                                  showTopSnackBar(
                                                                    Overlay.of(context),
                                                                    const CustomSnackBar.error(
                                                                      message:
                                                                          "please input correct number & Divison name",
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              child: const Text("Buy Now")),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      }))
                              : provider.index == 2
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: provider.banglalink.length,
                                          itemBuilder: (context, index) {
                                            return ListCardItem(
                                              title: provider.banglalink[index].title.toString(),
                                              discount:
                                                  provider.banglalink[index].discount.toString(),
                                              offer:
                                                  provider.banglalink[index].offerPrice.toString(),
                                              regularOffer: provider.banglalink[index].ragularPrice
                                                  .toString(),
                                              image: 'assets/banglink.png',
                                              myad: provider.banglalink[index].meyad.toString(),
                                              onTap: () {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(20.0),
                                                        child: Wrap(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "* শুধুমাত্র প্রিপেইড অপারেটর অফারটি নিতে পারবে এবং আপনি যদি আপনার ভুল নম্বর প্রবেশ করান তবে এটির জন্য আমরা দায়ি থাকব না ।",
                                                                style: latoStyle700Bold,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                provider.banglalink[index].location
                                                                    .toString(),
                                                                style: latoStyle700Bold,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "Buy At ${provider.banglalink[index].offerPrice.toString()}",
                                                                style: latoStyle700Bold.copyWith(
                                                                    color: Colors.green),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "Your account balance:  ${provider.balance.balance}BDT",
                                                                style: latoStyle700Bold.copyWith(
                                                                    color: Colors.black26),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: TextFormField(
                                                                keyboardType: TextInputType.number,
                                                                controller: number,
                                                                decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(25.0),
                                                                    borderSide: const BorderSide(
                                                                      color: Colors.red,
                                                                      width: 1.0,
                                                                    ),
                                                                  ),
                                                                  label: const Text(
                                                                      "* ১১ ডিজিটের নাম্বার"),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: TextFormField(
                                                                controller: division,
                                                                decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(25.0),
                                                                    borderSide: const BorderSide(
                                                                      color: Colors.red,
                                                                      width: 1.0,
                                                                    ),
                                                                  ),
                                                                  label: const Text(
                                                                      "* নাম্বারটি কোন বিভাগের ?"),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor: AppColors
                                                                          .primaryColorLight),
                                                                  onPressed: () {
                                                                    if (number.text.length == 11 &&
                                                                        division.text.isNotEmpty) {
                                                                      provider.buyOffer(
                                                                          id: provider
                                                                              .banglalink[index].id
                                                                              .toString(),
                                                                          phoneNumber: number.text,
                                                                          division: division.text,
                                                                          callback: (value) {
                                                                            showTopSnackBar(
                                                                              Overlay.of(context),
                                                                              CustomSnackBar.info(
                                                                                message: value,
                                                                              ),
                                                                            );
                                                                          });
                                                                    } else {
                                                                      showTopSnackBar(
                                                                        Overlay.of(context),
                                                                        const CustomSnackBar.error(
                                                                          message:
                                                                              "please input correct number & Divison name",
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                  child: const Text("Buy Now")),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          }))
                                  : Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: provider.robi.length,
                                          itemBuilder: (context, index) {
                                            return ListCardItem(
                                              title: provider.robi[index].title.toString(),
                                              discount: provider.robi[index].discount.toString(),
                                              offer: provider.robi[index].offerPrice.toString(),
                                              regularOffer:
                                                  provider.robi[index].ragularPrice.toString(),
                                              image: 'assets/robi.png',
                                              myad: provider.robi[index].meyad.toString(),
                                              onTap: () {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(20.0),
                                                        child: Wrap(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "* শুধুমাত্র প্রিপেইড অপারেটর অফারটি নিতে পারবে এবং আপনি যদি আপনার ভুল নম্বর প্রবেশ করান তবে এটির জন্য আমরা দায়ি থাকব না ।",
                                                                style: latoStyle700Bold,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                provider.robi[index].location
                                                                    .toString(),
                                                                style: latoStyle700Bold,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "Buy At ${provider.robi[index].offerPrice.toString()}",
                                                                style: latoStyle700Bold.copyWith(
                                                                    color: Colors.green),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "Your account balance:  ${provider.balance.balance}BDT",
                                                                style: latoStyle700Bold.copyWith(
                                                                    color: Colors.black26),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: TextFormField(
                                                                keyboardType: TextInputType.number,
                                                                controller: number,
                                                                decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(25.0),
                                                                    borderSide: const BorderSide(
                                                                      color: Colors.red,
                                                                      width: 1.0,
                                                                    ),
                                                                  ),
                                                                  label: const Text(
                                                                      "* ১১ ডিজিটের নাম্বার"),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: TextFormField(
                                                                controller: division,
                                                                decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(25.0),
                                                                    borderSide: const BorderSide(
                                                                      color: Colors.red,
                                                                      width: 1.0,
                                                                    ),
                                                                  ),
                                                                  label: const Text(
                                                                      "* নাম্বারটি কোন বিভাগের ?"),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: double.infinity,
                                                              child: ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor: AppColors
                                                                          .primaryColorLight),
                                                                  onPressed: () {
                                                                    if (number.text.length == 11 &&
                                                                        division.text.isNotEmpty) {
                                                                      provider.buyOffer(
                                                                          id: provider
                                                                              .robi[index].id
                                                                              .toString(),
                                                                          phoneNumber: number.text,
                                                                          division: division.text,
                                                                          callback: (value) {
                                                                            showTopSnackBar(
                                                                              Overlay.of(context),
                                                                              CustomSnackBar.info(
                                                                                message: value,
                                                                              ),
                                                                            );
                                                                          });
                                                                    } else {
                                                                      showTopSnackBar(
                                                                        Overlay.of(context),
                                                                        const CustomSnackBar.error(
                                                                          message:
                                                                              "please input correct number & Divison name",
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                  child: const Text("Buy Now")),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          }),
                                    )
                ]),
              ),
            );
    });
  }
}
