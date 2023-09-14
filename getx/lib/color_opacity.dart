import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/color_opacity_controller.dart';

class ColorOpacity extends StatefulWidget {
  const ColorOpacity({super.key});

  @override
  State<ColorOpacity> createState() => _ColorOpacityState();
}

class _ColorOpacityState extends State<ColorOpacity> {

  ColorOpacityController controller = Get.put(ColorOpacityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Obx(() => Container(
          height: 200,
          width: 200,
          color: Colors.red.withOpacity(controller.opacity.value),
        )),
        Obx(() => Slider(value: controller.opacity.value, onChanged: (value) {
          controller.setOpacity(value);
        },))
      ]),
    );
  }
}
