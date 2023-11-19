import 'package:arg_offer/provider/auth_provider.dart';
import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/provider/navigation_provider.dart';
import 'package:arg_offer/provider/payment._provider.dart';
import 'package:arg_offer/provider/spalsh_providder.dart';
import 'package:arg_offer/provider/theme_provider.dart';
import 'package:arg_offer/screens/landing_screen.dart';
import 'package:arg_offer/splash_screen.dart';
import 'package:arg_offer/util/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) =>runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
         ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
 ChangeNotifierProvider(create: (context) => di.sl<NavigationProvider>()),
  ChangeNotifierProvider(create: (context) => di.sl<HomePageProvider>()),
   ChangeNotifierProvider(create: (context) => di.sl<PaymentProvider>()),
    ],
    child: const MyApp(),
  ) )
  );
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
 
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child)
      { return MaterialApp(
          title: 'Help Adobe',
          theme:  AppTheme.getLightModeTheme(),
          debugShowCheckedModeBanner: false,
          scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
          home: child
      ); },
      child: const SplashScreen(),
    );
  }
}