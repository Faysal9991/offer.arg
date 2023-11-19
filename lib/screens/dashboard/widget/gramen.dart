import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/screens/dashboard/widget/airtel.dart';
import 'package:flutter/material.dart';

Widget grameenPhoneOffer(HomePageProvider provider,VoidCallback onTap) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.grameenphone.length,
      itemBuilder: (context, index) {
        return ListCardItem(
          title: provider.grameenphone[index].title.toString(),
          discount: provider.grameenphone[index].discount.toString(),
          offer: provider.grameenphone[index].offerPrice.toString(),
          regularOffer: provider.grameenphone[index].ragularPrice.toString(),
          image: 'assets/gramine.png',
          myad: provider.grameenphone[index].meyad.toString(),
          onTap: onTap,
        ); });
}
