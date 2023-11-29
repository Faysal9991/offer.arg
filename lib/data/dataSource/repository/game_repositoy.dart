

import 'package:arg_offer/data/dataSource/dio/dio_client.dart';
import 'package:arg_offer/data/dataSource/exception/api_error_handler.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:dio/dio.dart';

class GameRepo {
  final DioClient dioClient;

  GameRepo({required this.dioClient,});

 Future<ApiResponse>getGamingOffer(String offerNAme) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/gaming/$offerNAme");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
 Future<ApiResponse>getFootballOffer(String offerNAme) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("arg-offer/football/efootball$offerNAme");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
   Future<ApiResponse>buyGameOffer(String offerId,String playerId) async {
    Map data ={
    "offer_id":offerId,
     "player_id":playerId,
    };
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.post("arg-offer/buy-gaming",data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
 
    Future<ApiResponse>buyFootball(String offerId,String playerId,String gamePassword) async {
    Map data ={
    "offer_id":offerId,
    "game_password":gamePassword,
     "player_id":playerId,
    };
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.post("arg-offer/buy-football",data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
  }