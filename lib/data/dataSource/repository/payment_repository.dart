

import 'dart:convert';

import 'package:arg_offer/data/dataSource/dio/dio_client.dart';
import 'package:arg_offer/data/dataSource/exception/api_error_handler.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:dio/dio.dart';

class Payment {
  final DioClient dioClient;

  Payment({required this.dioClient});

   Future<ApiResponse>getBankDetails() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/add-balance");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
    Future<ApiResponse>addBalance({ required String methodName,required String ammount,required String transactionId}) async {
      Map data = {
         "payment_method":methodName,
         "amount":ammount,
         "transaction_id":transactionId
      };
    
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.post("arg-offer/deposit",data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
  }