import 'package:arg_offer/data/dataSource/repository/home_repository.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:arg_offer/data/model/response/base/error_response.dart';
import 'package:arg_offer/model/balance.dart';
import 'package:arg_offer/model/notification_model.dart';
import 'package:arg_offer/model/offer_model.dart';
import 'package:arg_offer/model/public_order_model.dart';
import 'package:arg_offer/model/support_model.dart';
import 'package:arg_offer/model/tranjection.dart';
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

  List <Tranjection> trajection = [];
Future tranjection() async {
  trajection.clear();
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await homeRepo.allTranjection();
    if (apiResponse.response.statusCode == 200) {
   
    apiResponse.response.data["transactions"].forEach((element) async {
  trajection.add( Tranjection.fromJson(element));
});
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

 Future buyOffer({String? id,String? phoneNumber,String? division,required Function callback}) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await homeRepo.buyOffer(id!,phoneNumber!,division!);
    if (apiResponse.response.statusCode == 200) {
  callback("${apiResponse.response.data["message"]}");
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
       callback(errorMessage);
    }
    isLoading = false;
    notifyListeners();
  }

List<OrderModel>oder=[];
 Future getMyOrder() async {
    oder.clear();
    notifyListeners();

    ApiResponse apiResponse = await homeRepo.getAllOrderList();
    if (apiResponse.response.statusCode == 200) {
     apiResponse.response.data["orders"].forEach((element){
   oder.add(OrderModel.fromJson(element));
     });
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
List<NotificationModel>notification=[];
 Future getNotifcation() async {
    notification.clear();
    notifyListeners();

    ApiResponse apiResponse = await homeRepo.getAllnotification();
    if (apiResponse.response.statusCode == 200) {
     apiResponse.response.data["notifications"].forEach((element){
   notification.add(NotificationModel.fromJson(element));
     });
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

SupportModel  supportModel = SupportModel();

Future getSupport() async {
    notification.clear();
    notifyListeners();

    ApiResponse apiResponse = await homeRepo.getSupport();
    if (apiResponse.response.statusCode == 200) {
      supportModel = SupportModel.fromJson(apiResponse.response.data);
   
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
