
import 'package:arg_offer/data/dataSource/dio/dio_client.dart';
import 'package:arg_offer/data/dataSource/exception/api_error_handler.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:arg_offer/app_conostant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

double progressPercent = 0;

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login( String email,String password,  {ProgressCallback? onSendProgress}) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map map = {};
     
      map.addAll({
        'email':email,
        'password': password});
      response = await dioClient.post(AppConstant.loginURI, data: map, onSendProgress: onSendProgress);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> signUp(String name, String email, String phone, String password,
      {ProgressCallback? onSendProgress}) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      Map map = {};
     
      map.addAll({"name": name, "email": email, "phone": phone, "password": password});
      response = await dioClient.post(AppConstant.signUpURI, data: map, onSendProgress: onSendProgress);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

 
  //TODO: for save User Information
  Future<void> saveUserInformation(String userID, String name,String email,String mobile) async {
    try {
      await sharedPreferences.setString(AppConstant.userID, userID);
      await sharedPreferences.setString(AppConstant.userEmail, email);
      await sharedPreferences.setString(AppConstant.userName, name);
       await sharedPreferences.setString(AppConstant.mobile, mobile);
      getUserName();
      getUserID();
      getUserEmail();
    } catch (e) {
      rethrow;
    }
  }



  Future<void> changeUserName(String value) async {
    try {
      await sharedPreferences.setString(AppConstant.userName, value);
    } catch (e) {
      rethrow;
    }
  }

  //TODO:: for get User Information
  String getUserID() {
    return sharedPreferences.getString(AppConstant.userID) ?? "";
  }

  String getUserName() {
    return sharedPreferences.getString(AppConstant.userName) ?? "";
  }

  String getUserEmail() {
    return sharedPreferences.getString(AppConstant.userEmail) ?? "";
  }

 

  String getUserProfile() {
    return sharedPreferences.getString(AppConstant.mobile) ?? "";
  }

  // TODO; clear all user Information
  Future<bool> clearUserInformation() async {
    await sharedPreferences.remove(AppConstant.userID);
    await sharedPreferences.remove(AppConstant.userName);
    await sharedPreferences.remove(AppConstant.userEmail);
    return await sharedPreferences.remove(AppConstant.mobile);
  }

  // for  user token
  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio!.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};

    try {
      await sharedPreferences.setString(AppConstant.token, token);
    } catch (e) {
      rethrow;
    }
  }

  bool checkTokenExist() {
    return sharedPreferences.containsKey(AppConstant.token);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstant.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.token);
  }

  Future<bool> clearToken() async {
    return sharedPreferences.remove(AppConstant.token);
  }
}
