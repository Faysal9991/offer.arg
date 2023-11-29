
import 'package:arg_offer/data/dataSource/dio/dio_client.dart';
import 'package:arg_offer/data/dataSource/dio/logging_interceptor.dart';
import 'package:arg_offer/data/dataSource/repository/auth_repository.dart';
import 'package:arg_offer/data/dataSource/repository/game_repositoy.dart';
import 'package:arg_offer/data/dataSource/repository/home_repository.dart';
import 'package:arg_offer/data/dataSource/repository/payment_repository.dart';
import 'package:arg_offer/data/dataSource/repository/splash_repositoy.dart';
import 'package:arg_offer/provider/auth_provider.dart';
import 'package:arg_offer/provider/game_provider.dart';
import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/provider/navigation_provider.dart';
import 'package:arg_offer/provider/payment._provider.dart';
import 'package:arg_offer/provider/spalsh_providder.dart';
import 'package:arg_offer/provider/theme_provider.dart';
import 'package:arg_offer/app_conostant.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Core

  sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(), sharedPreferences: sl(), loggingInterceptor: sl()));
  // Repository
  sl.registerLazySingleton(() => SplashRepository(dioClient: sl()));
   sl.registerLazySingleton(() => HomeRepo(dioClient: sl()));
     sl.registerLazySingleton(() => Payment(dioClient: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(),sharedPreferences: sl()));
   sl.registerLazySingleton(() => GameRepo(dioClient: sl()));
  // bloc
  sl.registerFactory(() => ThemeProvider());
    sl.registerFactory(() => SplashProvider(splashRepository: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
    sl.registerFactory(() => NavigationProvider());
     sl.registerFactory(() => HomePageProvider(homeRepo: sl()));
        sl.registerFactory(() => PaymentProvider(payment: sl()));
         sl.registerFactory(() => GameProvider(gameRepo: sl()));


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}