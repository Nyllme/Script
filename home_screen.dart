
import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ngl_clone/pages/second_mini_screen.dart';
import 'package:ngl_clone/pages/third_mini_screen.dart';

import '../widget/lil_button.dart';
import '../widget/rounded_button_widget.dart';
import 'first_mini_screen.dart';
import 'fourth_mini_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.title = "Title"}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  SwiperController _swiperController = SwiperController();
  String _text = "Text is copied successfully";
  String _link = "A link variable that will be copied";
  var _selectedIndex = 0.obs;
  static final List<Widget>_widgetOptions = <Widget>[
    const FirstMiniScreen(),
    const SecondMiniScreen(),
    const ThirdMiniScreen(),
    const FourthMiniScreen(),
  ].obs;

  void _onItemTapped(RxInt index){
    setState(() {
      _selectedIndex=index;
    });
  }



  @override

  var file = Image.file(
    File('/storage/emulated/0/assets/background.jpg'),
  );

  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "PLAY"),
                    Tab(
                      text: "INBOX",
                    ),
                  ]),
            ),
          ),
          Container(
              width: Get.width,
              height: Get.height - 70,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Scaffold(
                      body: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        height: 200,
                        width: Get.width - 100,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.purple, Colors.orange])),
                            );
                          },
                          itemCount: 11,
                          controller: _swiperController,
                          pagination: SwiperPagination(),
                        ),
                      ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(children: [
                      //     FlowCard(
                      //       color: Colors.red,
                      //     ),
                      //     FlowCard(
                      //       color: Colors.blue,
                      //     ),
                      //     FlowCard(
                      //       color: Colors.black,
                      //     )
                      //   ]),
                      // ),
                      DotsIndicator(
                        dotsCount: 11,
                        position: _swiperController.index.toDouble(),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              color: Color(0xFFdae9e8),
                            ),
                            margin: EdgeInsets.all(15),
                            // padding: EdgeInsets.all(25),
                            width: Get.width,
                            child: Column(
                              children: [
                                Spacer(),
                                Text("Step 1: Copy your link"),
                                Spacer(),
                                Text("Please code in the link"),
                                Spacer(),
                                OutlinedButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(text: _text));
                                    Get.defaultDialog(
                                        content: Column(
                                          children: [
                                            Text("The text is copied succcessfully."),
                                            ElevatedButton(onPressed: (){
                                              Get.back();
                                            }, child: Text("back"))
                                          ],
                                        ),
                                    );
                                  },
                                  child: Text(
                                    "copy link",
                                    style: TextStyle(color: Colors.pink),
                                  ),
                                  style: ButtonStyle(),
                                ),
                                Spacer(),
                              ],
                            )),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              color: Color(0xFFdae9e8),
                            ),
                            margin:
                                EdgeInsets.only(right: 15, left: 15, bottom: 15),
                            // padding: EdgeInsets.all(25),
                            width: Get.width,
                            child: Column(
                              children: [
                                Spacer(),
                                Text(
                                    "Step 2: Share link on your Instagram Story"),
                                Spacer(),
                                RoundedButtonWidget(buttonText: 'A button', width: 100, onpressed: (){
                                  Get.defaultDialog(
                                    title: "How to add the Link to your story",
                                      content: Obx(() => Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              LilButton(index: 0, onTap: () {
                                                _onItemTapped(RxInt(0));
                                                setState(() {

                                                });
                                              },),
                                              LilButton(index: 1, onTap: () {
                                                _onItemTapped(RxInt(1));
                                                setState(() {

                                                });
                                              },),
                                              LilButton(index: 2, onTap: () {
                                                _onItemTapped(RxInt(2));
                                                setState(() {

                                                });
                                              },),
                                              LilButton(index: 3, onTap: () {
                                                _onItemTapped(RxInt(3));
                                                setState(() {

                                                });
                                              },),

                                            ],
                                          ),
                                          _widgetOptions[_selectedIndex.value]
                                        ],
                                      )));
                                },
                                ),
                                Spacer(),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(25),
                                //     gradient: LinearGradient(
                                //       begin: Alignment.centerLeft,
                                //       end: Alignment.centerRight,
                                //       colors: [Colors.purple, Colors.yellow]
                                //     )
                                //   ),
                                //   child: ElevatedButton(
                                //     onPressed: () {},
                                //     child: Text("A button"),
                                //     style: style,
                                //   ),
                                // ),
                              ],
                            )),
                      ),
                    ],
                  )),
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 300,
                          width: 200,
                          margin: const EdgeInsets.only(right: 10, top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
