import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/screens/dashboard/widget/airtel.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';

Widget robiOffer(HomePageProvider provider,VoidCallback onTap) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.robi.length,
      itemBuilder: (context, index) {
        return ListCardItem(
          title: provider.robi[index].title.toString(),
          discount: provider.robi[index].discount.toString(),
          offer: provider.robi[index].offerPrice.toString(),
          regularOffer: provider.robi[index].ragularPrice.toString(),
          image: 'assets/robi.png',
          myad: provider.robi[index].meyad.toString(),
          onTap: onTap,
        );  });
}
