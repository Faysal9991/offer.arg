import 'package:arg_offer/helper/helper.dart';
import 'package:arg_offer/provider/game_provider.dart';
import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/screens/dashboard/widget/airtel.dart';

import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FootballScreen extends StatefulWidget {
  const FootballScreen({super.key});

  @override
  State<FootballScreen> createState() => _FootballScreenState();
}

class _FootballScreenState extends State<FootballScreen> {
  TextEditingController playerId = TextEditingController();
  TextEditingController gamePassword = TextEditingController();
  List<String> gameItem = [
  "Android",
  "IOS",

  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GameProvider>(context, listen: false).getFootballOffer("A");
      Provider.of<HomePageProvider>(context, listen: false).getBalance();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomePageProvider,GameProvider>(builder: (context, home,game, child) {
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
                            child: Text("Football" , style: latoStyle700Bold,)
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
                                    "${home.balance.balance??"0"}",
                                    style: latoStyle700Bold,
                                  )
                                ],
                              )),
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
                            itemCount: gameItem.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if(index == 0){
                                         game.getFootballOffer("A");
                                      }else{
                                          game.getFootballOffer("I");
                                      }
                                     
                                      game.changeIndexFootball(index);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: game.footballIndex == index
                                              ? AppColors.primaryColorLight
                                              : Colors.white,
                                          border: Border.all(color: AppColors.secondaryColorLight),
                                          boxShadow: Helper.downShadow),
                                      child: Center(
                                          child: Text(
                                        gameItem[index],
                                        style: latoStyle700Bold.copyWith(
                                            color: game.footballIndex == index
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
          game.footballIndex ==0?ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: game.android.length,
            itemBuilder: (context,index){
            return  ListCardItem(
          title: game.android[index].title!,
         offer: game.android[index].offerPrice,
        
          regularOffer: game.android[index].ragularPrice,
       
          myad: game.android[index].meyad,
          onTap: (){
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
                                                  game.android[index].location.toString(),
                                                  style: latoStyle700Bold,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Buy At ${ game.android[index].offerPrice.toString()}",
                                                  style: latoStyle700Bold.copyWith(
                                                      color: Colors.green),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Your account balance:  ${home.balance.balance}BDT",
                                                  style: latoStyle700Bold.copyWith(
                                                      color: Colors.black26),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                
                                                  controller: playerId,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(25.0),
                                                      borderSide: const BorderSide(
                                                        color: Colors.red,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    label: const Text("Player Id"),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                
                                                  controller: gamePassword,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(25.0),
                                                      borderSide: const BorderSide(
                                                        color: Colors.red,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    label: const Text("Game Password"),
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
                                                      if( playerId.text.isEmpty|| gamePassword.text.isEmpty){
                                                         showTopSnackBar(
                                                              Overlay.of(context),
                                                              const CustomSnackBar.info(
                                                                message: "enter correct information",
                                                              ),
                                                            );
                                                      }else{
                                                             game.buyFootball(
                                                          id: game.idcode[index].id.toString(),
                                                          gamePassword: gamePassword.text,
                                                         playerId: playerId.text,
                                                          callback: (value) {
                                                            showTopSnackBar(
                                                              Overlay.of(context),
                                                              CustomSnackBar.info(
                                                                message: value,
                                                              ),
                                                            );
                                                          });
                                                 
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
          }):game.footballIndex ==1?ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: game.ios.length,
            itemBuilder: (context,index){
            return  ListCardItem(
          title: game.ios[index].title!,
         offer: game.ios[index].offerPrice,
        
          regularOffer: game.ios[index].ragularPrice,
       
          myad: game.ios[index].meyad,
          onTap: (){
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
                                                  game.ios[index].location.toString(),
                                                  style: latoStyle700Bold,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Buy At ${ game.ios[index].offerPrice.toString()}",
                                                  style: latoStyle700Bold.copyWith(
                                                      color: Colors.green),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Your account balance:  ${home.balance.balance}BDT",
                                                  style: latoStyle700Bold.copyWith(
                                                      color: Colors.black26),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                
                                                  controller: playerId,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(25.0),
                                                      borderSide: const BorderSide(
                                                        color: Colors.red,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    label: const Text("Player Id"),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                
                                                  controller: gamePassword,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(25.0),
                                                      borderSide: const BorderSide(
                                                        color: Colors.red,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    label: const Text("Game password"),
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
                                                      if( playerId.text.isEmpty|| gamePassword.text.isEmpty){
                                                         showTopSnackBar(
                                                              Overlay.of(context),
                                                              const CustomSnackBar.error(
                                                                message: "enter correct information",
                                                              ),
                                                            );
                                                      }else{
                                                             game.buyFootball(
                                                          id: game.ios[index].id.toString(),
                                                          gamePassword: gamePassword.text,
                                                         playerId: playerId.text,
                                                          callback: (value) {
                                                            showTopSnackBar(
                                                              Overlay.of(context),
                                                              CustomSnackBar.info(
                                                                message: value,
                                                              ),
                                                            );
                                                          });
                                                 
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
          }):const SizedBox.shrink()
                      
          ]),
        ),
      );
    });
  }
}
