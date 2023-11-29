

import 'package:arg_offer/data/dataSource/dio/dio_client.dart';
import 'package:arg_offer/data/dataSource/exception/api_error_handler.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final DioClient dioClient;

  HomeRepo({required this.dioClient,});

 Future<ApiResponse>getOffer(String simName) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/my-offer/$simName");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
   Future<ApiResponse>allTranjection() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/transactions");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }


   Future<ApiResponse>balance() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/my-profile");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

   Future<ApiResponse>buyOffer(String offerId,String phoneNumber,String division) async {
    Map data ={
    "offer_id":offerId,
     "phone_number":phoneNumber,
     "payment_from":division
    };
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.post("arg-offer/buy-offer",data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
   Future<ApiResponse>getAllOrderList() async {
   
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/orders");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
    Future<ApiResponse>getAllnotification() async {
   
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/notifications");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
 
  Future<ApiResponse>getSupport() async {
   
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/support");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
  }