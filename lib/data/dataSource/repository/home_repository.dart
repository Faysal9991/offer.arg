

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

   Future<ApiResponse>balance() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/my-profile");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
  }