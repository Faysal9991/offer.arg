import 'package:arg_offer/helper/helper.dart';
import 'package:arg_offer/provider/spalsh_providder.dart';
import 'package:arg_offer/screens/auth/login_screen.dart';
import 'package:arg_offer/screens/auth/sign_up_Screen.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String? videoId = "";

  late YoutubePlayerController controller;
  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=BBAyRBTfsOU");

    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    Future.delayed(Duration.zero, () async {
      Provider.of<SplashProvider>(context, listen: false).getSplashOffers();
    });

    super.initState();
  }

  void listener() {
    if (controller.value.isReady) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Consumer<SplashProvider>(builder: (context, provider, child) {
        return provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColorLight),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: Helper.downShadow,
                                        image: const DecorationImage(
                                            image: AssetImage('assets/org_icon.png',),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Helper.toScreen(context, const LoginScreen());
                                      },
                                      child: Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "Login",
                                              style: latoStyle700Bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap:(){
                                        Helper.toScreen(context, const SignUpScreen());
                                      },
                                      child: Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("Sign up", style: latoStyle700Bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: Helper.downShadow,
                              color: AppColors.secondaryColorLight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Recharge your mobile from any operator just a click anytime anywhere",
                                  style: latoStyle700Bold.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColorLight,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: Helper.softUiShadow),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                "Recharge your mobile from any operator just a click anytime anywhere",
                                style: latoStyle700Bold,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                textAlign: TextAlign.center,
                                "👉 সকল বিস্তারিত  জানতে ভিডিও টি দেখতে পারেন:-👇👇",
                                style: latoStyle600SemiBold.copyWith(
                                    fontSize: 17, color: Colors.black),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.secondaryColorLight,
                                ),
                                width: double.infinity,
                                child: YoutubePlayer(
                                  controller: controller,
                                  showVideoProgressIndicator: true,
                                  onReady: () {
                                    controller.addListener(listener);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                 provider.publicOder.isEmpty?SizedBox.shrink():   Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: CarouselSlider(
                        items: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColorLight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                "যদি কারো কোন ধরনের সমস্যা হয় তাহলে আমাদের হেল্প লাইনে যোগাযোগ করুনঃ-01907334326",
                                style: latoStyle600SemiBold.copyWith(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                            height: 60,
                            autoPlay: true, // Enable auto-play
                            autoPlayInterval: const Duration(seconds: 5), // Set auto-play interval
                            enlargeCenterPage: true, // Make the current item larger
                            viewportFraction: 1, // Fraction of the viewport to show
                            autoPlayCurve: Curves.bounceOut),
                      ),
                    ),
                    //TODO: Here steart api section


                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: Helper.downShadow,
                            color: AppColors.secondaryColorLight,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          "সাম্প্রতিক বিক্রি",
                          style: latoStyle700Bold.copyWith(fontSize: 25),
                        )),
                      ),
                    ),
                        CarouselSlider.builder(
   options: CarouselOptions(
                           height: 160,
                            autoPlay: true, // Enable auto-play
                            autoPlayInterval: const Duration(seconds: 5), // Set auto-play interval
                            enlargeCenterPage: true, // Make the current item larger
                            viewportFraction: 1, // Fraction of the viewport to show
                            autoPlayCurve: Curves.bounceOut),
                      
                  
                        itemCount: provider.publicOder.length,
                        itemBuilder: (context, index,page) {
                      
                          return listCardSell(
                            packageName: provider.publicOder[index].title??"",
                            regularOffer:  provider.publicOder[index].amount??"",
                           phoneNumber:   provider.publicOder[index].phoneNumber!="0"?provider.publicOder[index].phoneNumber:provider.publicOder[index].data);
                        }),

                          Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: Helper.downShadow,
                            color: AppColors.secondaryColorLight,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          "আকর্ষণীয় অফারসমূহ",
                          style: latoStyle700Bold.copyWith( fontSize: 25),
                        )),
                      ),
                    ),
                   
                    
CarouselSlider.builder(
   options: CarouselOptions(
                            height: 160,
                            autoPlay: true, // Enable auto-play
                            autoPlayInterval: const Duration(seconds: 5), // Set auto-play interval
                            enlargeCenterPage: true, // Make the current item larger
                            viewportFraction: 1, // Fraction of the viewport to show
                            autoPlayCurve: Curves.bounceOut),
                      
                  
                        itemCount: provider.publicOffer.length,
                        itemBuilder: (context, index,page) {
                          return listCard(
                            simName: provider.publicOffer[index].oparator!,
                              packageName: provider.publicOffer[index].title!,
                              discount: provider.publicOffer[index].discount!,
                              todayOffer: provider.publicOffer[index].offerPrice!,
                              regularOffer: provider.publicOffer[index].ragularPrice!,
                              myad: provider.publicOffer[index].meyad!);
                        }),
                         
                  ],
                ),
              );
      }),
    );
  }
}

Widget listCard({
    required String? simName,
  required String? packageName,
  required String? discount,
  required String? todayOffer,
  required String? regularOffer,
  required String? myad,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shadowColor: AppColors.secondaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:  Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              
            ),
            child: Row(
              children: [
                
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xffeaeded),
                    child: Center(
                        child: Text(
                      simName??"",
                      style: latoStyle600SemiBold.copyWith(color: Colors.green),
                    )),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(packageName??"",style: latoStyle600SemiBold.copyWith(fontSize: 13),),
                    const SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            "ডিসকাউন্ট : ",
                            style: testStyle(),
                          ),
                          Text(discount??"", style: testStyle()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("আজকের দাম : ", style: testStyle()),
                          Text(todayOffer??"", style: testStyle(color: Colors.black)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("রেগুলার দাম : ", style: testStyle()),
                          Text(regularOffer??"", style: testStyle()),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "মেয়াদ : ",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                           myad??"",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                  
                    ],
                  ),
                ),
               ],
            ),
         
          ),
         
    ),
  );
}

testStyle({Color color = AppColors.hintTextColorLight}) {
  return GoogleFonts.lato(color: color, fontSize: 15, fontWeight: FontWeight.w700);
}


Widget listCardSell({
    
  required String? packageName,
  required String? regularOffer,
  String? phoneNumber,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shadowColor: AppColors.secondaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:  Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xffeaeded),
                    child: Center(
                        child: Text(
                     "Approve",
                      style: latoStyle600SemiBold.copyWith(color: Colors.green),
                    )),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   packageName== null?SizedBox.shrink():Text(packageName,style: latoStyle600SemiBold.copyWith(fontSize: 13,),),
                     packageName== null?SizedBox.shrink(): SizedBox(height: 10,),
                     
                       Row(
                        children: [
                          Text("রেগুলার দাম : ", style: testStyle()),
                          Text(regularOffer??"", style: testStyle()),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "মোবাইল নাম্বার :",
                            style:testStyle() 
                          ),
                          Container(
                            width: 100,
                         
                            child: Text(
                              
                                                "${phoneNumber!.substring(0, phoneNumber.length - 3)}***",
                              style: testStyle(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                     ]
                ),
             ) ]
            ),
         
          ),
         
    ),
  );
}
