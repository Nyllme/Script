import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/controllers/counterController.dart';
import 'package:web_app/screens/other.dart';

class HomeScreen extends StatelessWidget {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Obx(()=>Text("Clicks: ${counterController.counter.value}"))),
          SizedBox(
            height: 10,
          ),
          Center(child: ElevatedButton(onPressed: () {
            Get.to(OtherScreen());
          },
              child: Text("Open Other Screen")))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counterController.increment();
        },
        child: Icon(Icons.add)
      ),
    );

  }
}
