import 'package:arg_offer/data/dataSource/repository/payment_repository.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:arg_offer/data/model/response/base/error_response.dart';
import 'package:arg_offer/model/bank.dart';
import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  final Payment payment;
  PaymentProvider({required this.payment});

  bool isLoading = false;


  List<BankDetails> bankInfo = [];

  Future geBankDetails(String sim) async {
    
    isLoading = true;
    notifyListeners();

    ApiResponse apiResponse = await payment.getBankDetails();
    if (apiResponse.response.statusCode == 200) {
     apiResponse.response.data["banks"].forEach((item){
      bankInfo.add(BankDetails.fromJson(item));
     });
      
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

