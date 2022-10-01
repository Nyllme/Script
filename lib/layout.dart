import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/helpers/responsiveness.dart';
import 'package:web_app/widgets/large_screen.dart';
import 'package:web_app/widgets/small_screen.dart';
import 'package:web_app/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(),
      body: ResponsiveWidget(largeScreen: LargeScreen(), smallScreen: SmallScreen(),)
    );
  }
}
