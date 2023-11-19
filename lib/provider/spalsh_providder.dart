
import 'package:arg_offer/data/dataSource/repository/splash_repositoy.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:arg_offer/model/public_offer_model.dart';
import 'package:arg_offer/model/public_order_model.dart';
import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier{
  final SplashRepository splashRepository;
  SplashProvider({required this.splashRepository});

  bool isLoading = false;
List <PublicOffer> publicOffer = [];
List <OrderModel> publicOder = [];
Future getSplashOffers()async{
  isLoading = true;
  notifyListeners();
ApiResponse response = await splashRepository.getPublicOffer() ;
if(response.response.statusCode ==200){
     response.response.data["offers"].forEach((element) {
        publicOffer.add(PublicOffer.fromJson(element));
        isLoading = false;
}
);
  response.response.data["orders"].forEach((element) {
        publicOder.add(OrderModel.fromJson(element));
        isLoading = false;
});

}
notifyListeners();
}

}