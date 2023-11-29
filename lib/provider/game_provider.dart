import 'package:arg_offer/data/dataSource/repository/game_repositoy.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:arg_offer/data/model/response/base/error_response.dart';
import 'package:arg_offer/model/gaming_offer_model.dart';
import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  final GameRepo gameRepo;
  GameProvider({required this.gameRepo});

  int index = 0;
  bool isLoading = false;
  int footballIndex = 0;
  changeIndex(int value) {
    index = value;
    notifyListeners();
  }
  changeIndexFootball(int value) {
    footballIndex = value;
    notifyListeners();
  }
  List<GamingOffer> uniPin = [];
  List<GamingOffer> weeklyMonthly = [];
  List<GamingOffer> idcode = [];
   List<GamingOffer> android= [];
List<GamingOffer> ios= [];
  Future getGameOffer(String itemName) async {
   uniPin.clear();
   weeklyMonthly.clear();
   idcode.clear();
    isLoading = true;
    notifyListeners();

    ApiResponse apiResponse = await gameRepo.getGamingOffer(itemName);
    if (apiResponse.response.statusCode == 200) {
      if (itemName == "UniPin") {
        apiResponse.response.data["offers"].forEach((element) {
          uniPin.add(GamingOffer.fromJson(element));
        });
      } else if (itemName == "WeeklyMonthly") {
        apiResponse.response.data["offers"].forEach((element) {
          weeklyMonthly.add(GamingOffer.fromJson(element));
        });
      } else if (itemName == "Idcode") {
        apiResponse.response.data["offers"].forEach((element) {
          idcode.add(GamingOffer.fromJson(element));
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





 Future getFootballOffer(String itemName) async {
   android.clear();
   ios.clear();

    isLoading = true;
    notifyListeners();

    ApiResponse apiResponse = await gameRepo.getFootballOffer(itemName);
    if (apiResponse.response.statusCode == 200) {
      if (itemName == "A") {
        apiResponse.response.data["offers"].forEach((element) {
          android.add(GamingOffer.fromJson(element));
        });
      } else if (itemName == "I") {
        apiResponse.response.data["offers"].forEach((element) {
          ios.add(GamingOffer.fromJson(element));
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

   Future buyOffer({String? id,String? playerId,required Function callback}) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await gameRepo.buyGameOffer(id!,playerId!);
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

 Future buyFootball({String? id,String? gamePassword,String?playerId,required Function callback}) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await gameRepo.buyFootball(id!,gamePassword!,playerId!);
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
}
