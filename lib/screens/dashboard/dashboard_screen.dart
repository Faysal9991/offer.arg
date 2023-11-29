import 'package:arg_offer/provider/navigation_provider.dart';
import 'package:arg_offer/screens/dashboard/home_screen.dart';
import 'package:arg_offer/screens/game/football.dart';
import 'package:arg_offer/screens/game/game.dart';
import 'package:arg_offer/screens/order_list.dart';
import 'package:arg_offer/screens/payment/add_balance.dart';
import 'package:arg_offer/util/bottom_navigation/custom_bottom_nev.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /// widget list
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
   const MobileGameScreen(),
    const FootballScreen(),
    const OrderList(),
   const AddBalanceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: bottomBarPages[provider.index],
        bottomNavigationBar: const CustomBottomNavigation(
          itemCount: 5,
          selectedIconList: [
            "assets/icon/home.svg",
            "assets/icon/game.svg",
            "assets/icon/football.svg",
            "assets/icon/order.svg",
            "assets/icon/payment.svg"
          ],
          disSelectedIconList: [
            "assets/icon/home_outline.svg",
            "assets/icon/game_outline.svg",
            "assets/icon/football_outline.svg",
            "assets/icon/order_outline.svg",
            "assets/icon/payment_outline.svg"
          ],
        ),
      );
    });
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.scaffold, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightGreenAccent, child: const Center(child: Text('Page 5')));
  }
}
