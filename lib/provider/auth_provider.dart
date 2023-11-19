import 'dart:async';
import 'package:arg_offer/data/dataSource/repository/auth_repository.dart';
import 'package:arg_offer/data/model/response/base/api_response.dart';
import 'package:arg_offer/data/model/response/base/error_response.dart';
import 'package:flutter/material.dart';

class CallBackResponse {
  bool status;
  String message;

  CallBackResponse({this.status = false, this.message = ''});
}

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String data = '';
  bool isNumber = false;

  //TODO:: for Sign Up Section

  Future signUp({required String userName,required String email, required String password,required String phone,required Function callback}) async {
    _isLoading = true;
    notifyListeners();
  
    ApiResponse apiResponse = await authRepo.signUp(userName, email, phone,password);
    _isLoading = false;
    if (apiResponse.response.statusCode == 200) {
      if (authRepo.checkTokenExist()) {
        authRepo.clearUserInformation();
        authRepo.clearToken();
      }
      authRepo.saveUserToken(apiResponse.response.data['token'].toString());
      authRepo.saveUserInformation(
          apiResponse.response.data['token'].toString(),
        '${apiResponse.response.data["user"]['name']}',
          '${apiResponse.response.data["user"]['email']}',
          '${apiResponse.response.data["user"]['mobile']}',
          );
  
      userID = '${apiResponse.response.data['token']}';
    
      callback(true, 'Sign Up Successfully');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        debugPrint(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.toString();
      }
      callback(false, errorMessage);
    }
    notifyListeners();
  }



  //TODO:: for Sign in Section

  Future signIn(String email, String password,Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(email, password, onSendProgress: (int sentBytes, int totalBytes) {

    });
    _isLoading = false;
    if (apiResponse.response.statusCode == 200) {
      if (authRepo.checkTokenExist()) {
        authRepo.clearUserInformation();
        authRepo.clearToken();
      }
      authRepo.saveUserToken(apiResponse.response.data['token'].toString());
       authRepo.saveUserInformation(
          apiResponse.response.data['token'].toString(),
        '${apiResponse.response.data["user"]['name']}',
          '${apiResponse.response.data["user"]['email']}',
          '${apiResponse.response.data["user"]['mobile']}',
          );
  
      userID = '${apiResponse.response.data['token']}';
    
    callback(true,'Login Successfully');
    
    }
    else {

      String errorMessage;
      if (apiResponse.error is String) {
        debugPrint(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.toString();
      }
  
    callback(false, errorMessage);
      
    }
     notifyListeners();
  }

  //TODO: for Logout
  Future<bool> logout() async {
    authRepo.clearToken();
    authRepo.clearUserInformation();
    return true;
  }

  //TODO: for Logout
  bool checkTokenExist() {
    return authRepo.checkTokenExist();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  // get User INFO:
  String name = '';
  String profileImage = '';
  String userID = '';
  String userCode = '';

  void getUserInfo() {
    name = authRepo.getUserName();
    profileImage = authRepo.getUserProfile();
    userID = authRepo.getUserID();
    notifyListeners();
  }

//TODO: for country code picker
  String code = "+880";

 

  bool isSelectEmail = false;

  void changeSelectStatus(bool value) {
    isSelectEmail = value;
    notifyListeners();
  }
}