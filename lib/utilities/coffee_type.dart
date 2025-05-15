import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;

  CoffeeType({
    super.key,
    required this.coffeeType,
    required this.isSelected,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 25.0.w),
        child: Text(coffeeType,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: isSelected ? Color(0xFF98A95F) : Color(0xFF4C2B08) //green when selected other wise it is brown
          ),
        ),   
      ),
    );   
  }
}