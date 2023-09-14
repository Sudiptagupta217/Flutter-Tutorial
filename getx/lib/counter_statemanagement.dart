
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/counter_controller.dart';

class CounterStateManagement extends StatefulWidget {
  const CounterStateManagement({super.key});

  @override
  State<CounterStateManagement> createState() => _CounterStateManagementState();

}

class _CounterStateManagementState extends State<CounterStateManagement> {

  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print("rebuil");
    return Scaffold(
      body: Center(
        child:Obx(()=> Text("result:"+controller.counter.toString(),style: TextStyle(fontSize: 25),)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.incrementCounter();
        },
      ),
    );
  }
}
