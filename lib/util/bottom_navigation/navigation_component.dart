import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationWidget extends StatelessWidget {
  final bool isSelected;
  final String iconName;
  final VoidCallback onTap;
  const BottomNavigationWidget({
    super.key, this.isSelected = false,required this.iconName,required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
      
      child: Stack(
          clipBehavior: Clip.none,
        children: [
          Center(child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(iconName,height:24,width:24,color:isSelected?Color(0xff1AA483):Colors.black,),
          )),
       isSelected? Positioned(
            top: 52.5,
            left: 8,
            child: Container(height: 5,
            width: 30,
            color: Color(0xff1AA483),),
          ):const SizedBox.shrink()
        ],
      ),
      ),
    );
  }
}
