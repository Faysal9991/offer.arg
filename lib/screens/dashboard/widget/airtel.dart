import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';

Widget airtelOffer(HomePageProvider provider,VoidCallback onTap) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.airtel.length,
      itemBuilder: (context, index) {
        return  ListCardItem(discount: provider.airtel[index].discount.toString(),title:provider.airtel[index].title.toString(), offer: provider.airtel[index].offerPrice.toString(), regularOffer: provider.airtel[index].ragularPrice.toString(), image: "assets/airtel.png", myad: provider.airtel[index].meyad.toString(), onTap: onTap);});
}








class ListCardItem extends StatelessWidget {
 final String title;
 final  String discount;
   final String offer;
   final  String regularOffer;
   final  String myad;
   final  String image;
   final  VoidCallback onTap;
  const ListCardItem({super.key,
  required this.title,
  required this.discount,
  required this.offer,
  required this.regularOffer,
  required this.image,
  required this.myad,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Row(
children: [
Expanded(
  flex: 1,
  child: Image.asset(image)),
  const SizedBox(width: 10),
                  Expanded(
                     flex: 4,
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Text(title,
                                  style: latoStyle500Medium,
                    ),
                    const SizedBox(height: 5,),
                      Text.rich(TextSpan(
                     text: "ডিসকাউন্ট: ",
                     style: latoStyle500Medium.copyWith(color: AppColors.hintTextColorLight),
                     children: [
                       TextSpan(
                           text: discount,
                           style: latoStyle500Medium.copyWith(color: AppColors.primaryColorLight),
                           children: [TextSpan(text: " টাকা", style: latoStyle500Medium.copyWith( color: AppColors.primaryColorLight))])
                     ])),
                     //----------------------
                    const SizedBox(height: 5,),
                       Text.rich(TextSpan(
                     text: "আজকের অফার মূল্য : ",
                     style: latoStyle500Medium.copyWith(color: AppColors.hintTextColorLight),
                     children: [
                       TextSpan(
                           text: offer,
                           style: latoStyle500Medium,
                           children: [TextSpan(text: " টাকা", style: latoStyle500Medium)])
                     ])),
                     //-------------------------
                  const SizedBox(height: 5,),
                       Text.rich(TextSpan(
                     text: "রেগুলার মূল্য : ",
                     style: latoStyle500Medium.copyWith(color: AppColors.hintTextColorLight),
                     children: [
                       TextSpan(
                           text: regularOffer,
                           style: latoStyle500Medium.copyWith(decoration: TextDecoration.lineThrough),
                           children: [TextSpan(text: " টাকা", style: latoStyle500Medium)])
                     ])),
                     //---------------------
                     const SizedBox(height: 5,),
                       Text.rich(TextSpan(
                     text: "মেয়াদ: ",
                     style: latoStyle500Medium.copyWith(color: AppColors.hintTextColorLight),
                     children: [
                       TextSpan(
                           text: myad,
                           style: latoStyle500Medium,
                          )
                     ])),
                     
                      ],
                    ),
                  )
                ],
               ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColorLight
                  ),
                  onPressed: onTap, child: Text("Buy",style: latoStyle700Bold.copyWith(color: AppColors.secondaryColorLight),)),
              )
          
              
              ],
            ),
          ),
        );
    
  }
}