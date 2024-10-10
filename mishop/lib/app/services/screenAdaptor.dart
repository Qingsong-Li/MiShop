import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdaptor {
  static  width(num value){
    return value.w;
  }
   static  height(num value){
    return value.h;
  }
   static  fontSize(num value){
    return value.sp;
  }
   static  getScreenWidth(){
    return 1.sw;
  }
   static  getScreenHeight(num value){
    return 1.sh;
  }
}