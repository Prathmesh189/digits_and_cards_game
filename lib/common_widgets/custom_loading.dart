

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

Widget ShimmerLoading(double width ,double height ){
  return  Lottie.asset('assets/animations/loader.json'
      , width: width
      , reverse: true,
       height: height,
       fit: BoxFit.cover) ;
}