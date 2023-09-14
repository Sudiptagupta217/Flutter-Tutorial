

import 'package:get/get.dart';

class ColorOpacityController extends GetxController{

  RxDouble opacity = 0.4.obs;

  setOpacity(double value){
    opacity.value = value;
  }
}