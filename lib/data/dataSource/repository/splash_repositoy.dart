
import 'package:arg_offer/data/dataSource/dio/dio_client.dart';
import 'package:arg_offer/data/dataSource/exception/api_error_handler.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:dio/dio.dart';

double progressPercent = 0;
class  SplashRepository{
  final DioClient dioClient;
  SplashRepository({required this.dioClient});

  //TODO: get Coin Details

  Future<ApiResponse>getPublicOffer() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("public/arg-offer");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}