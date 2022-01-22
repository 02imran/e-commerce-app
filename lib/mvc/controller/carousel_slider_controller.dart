

import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  
  void getCurrentState(){
    RxInt _current = 0.obs;
    _current++;
  }
}