import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/screens/dashboard/widget/airtel.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';

Widget banglalinkOffer(HomePageProvider provider, VoidCallback onTap) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.banglalink.length,
      itemBuilder: (context, index) {
        return ListCardItem(
          title: provider.banglalink[index].title.toString(),
          discount: provider.banglalink[index].discount.toString(),
          offer: provider.banglalink[index].offerPrice.toString(),
          regularOffer: provider.banglalink[index].ragularPrice.toString(),
          image: 'assets/banglink.png',
          myad: provider.banglalink[index].meyad.toString(),
          onTap: onTap,
        );
      });
}
