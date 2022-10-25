
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:social_share/social_share.dart';
import 'package:file_picker/file_picker.dart';

import '../widget/lil_button.dart';

class ThirdMiniScreen extends StatefulWidget {
  const ThirdMiniScreen({Key? key}) : super(key: key);

  @override
  State<ThirdMiniScreen> createState() => _ThirdMiniScreenState();
}

class _ThirdMiniScreenState extends State<ThirdMiniScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text("Frame the link", style: TextStyle(fontSize: 20),),
          Container(height: 200,
            width: Get.width * 0.8,
            color: Colors.pink,
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 40,
            width: Get.width * 0.6,
            child: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                  if (result != null) {
                    File file = File(result.files.single.path!);
                    String filePath = file.path;
                    SocialShare.shareInstagramStory(filePath);
                  } else {
                    // User canceled the picker
                    null;
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                ),
                child: Text("Click me3")
            ),
          )
        ]);
  }
}