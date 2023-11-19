import 'package:arg_offer/data/dataSource/repository/home_repository.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:arg_offer/data/model/response/base/error_response.dart';
import 'package:arg_offer/model/balance.dart';
import 'package:arg_offer/model/offer_model.dart';
import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  final HomeRepo homeRepo;
  HomePageProvider({required this.homeRepo});

  int index = 0;
  bool isLoading = false;

  changeIndex(int value) {
    index = value;
    notifyListeners();
  }

  List<OfferModel> robi = [];
  List<OfferModel> airtel = [];
  List<OfferModel> banglalink = [];
  List<OfferModel> grameenphone = [];

  Future getOffer(String sim) async {
    robi.clear();
    airtel.clear();
    banglalink.clear();
    grameenphone.clear();
    isLoading = true;
    notifyListeners();

    ApiResponse apiResponse = await homeRepo.getOffer(sim);
    if (apiResponse.response.statusCode == 200) {
      if (sim == SimName.Airtel.name) {
        apiResponse.response.data["offers"].forEach((element) {
          airtel.add(OfferModel.fromJson(element));
        });
      } else if (sim == SimName.Banglalink.name) {
        apiResponse.response.data["offers"].forEach((element) {
          banglalink.add(OfferModel.fromJson(element));
        });
      } else if (sim == SimName.Robi.name) {
        apiResponse.response.data["offers"].forEach((element) {
          robi.add(OfferModel.fromJson(element));
        });
      } else {
        apiResponse.response.data["offers"].forEach((element) {
          grameenphone.add(OfferModel.fromJson(element));
        });
      }
      isLoading = false;
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        debugPrint(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.toString();
      }
    }
    isLoading = false;
    notifyListeners();
  }

Balance balance = Balance();

 Future getBalance() async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await homeRepo.balance();
    if (apiResponse.response.statusCode == 200) {
    balance = Balance.fromJson(apiResponse.response.data);
      isLoading = false;
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        debugPrint(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.toString();
      }
    }
    isLoading = false;
    notifyListeners();
  }


}

enum SimName { Airtel, Robi, Banglalink, Grameenphone }
