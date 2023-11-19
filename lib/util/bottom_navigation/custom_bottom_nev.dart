
import 'package:arg_offer/provider/navigation_provider.dart';
import 'package:arg_offer/util/bottom_navigation/navigation_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomBottomNavigation extends StatelessWidget {

  final int itemCount;
  final List<String> selectedIconList;
    final List<String> disSelectedIconList;
   const CustomBottomNavigation({super.key,required this.itemCount,required this.selectedIconList,required this.disSelectedIconList});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<NavigationProvider>(

          builder: (context, provider,child) {
            return Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Theme.of(context).cardColor),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for(var i = 0; i < itemCount; i++)
                          BottomNavigationWidget(
                            isSelected: provider.index ==i?true:false,
                            iconName:  provider.index ==i?selectedIconList[i]:disSelectedIconList[i], onTap: (){
                             provider.changeIndex(i);
                            
                             },),
                         
                  
                      ],
                    ),
                  ),
                );
          }
        )
         );
  }
}