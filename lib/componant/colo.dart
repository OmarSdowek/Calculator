

import 'dart:ui';

import 'package:flutter/material.dart';

Color? buttonsColors(String x){
 if(
     x == 'Del'||
     x == '%' ||
     x == '/'||
     x == '*' ||
     x == '+' ||
     x == '-'
 )
   return Colors.blue;
 else if(  x == 'C' || x == '=' || x == 'Ans')
  {
   return Colors.yellow[600];
  }
 else
  {
   return Colors.grey;
  }

}
Color textcolors(String x){

 if(
     x == 'C'||
     x == 'Ans'||
     x == '=' ||
     x == 'Del'||
     x == '%' ||
     x == '/'||
     x == '*' ||
     x == '+' ||
     x == '-'
 )
  return  Colors.black;
 else
  {
   return  Colors.white;
  }
}