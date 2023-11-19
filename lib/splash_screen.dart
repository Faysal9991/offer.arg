import 'package:arg_offer/provider/auth_provider.dart';
import 'package:arg_offer/screens/dashboard/dashboard_screen.dart';
import 'package:arg_offer/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
   void initState() {
    Future.delayed(const Duration(seconds: 1),(){
          if (Provider.of<AuthProvider>(context, listen: false)
            .getUserToken()
            .isEmpty) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LandingScreen()),
              (route) => false);
        } else {
         
          Provider.of<AuthProvider>(context, listen: false).getUserInfo();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const DashboardScreen()),
              (route) => false);
      
        }
    
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}