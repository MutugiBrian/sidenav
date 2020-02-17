import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidenav/base/base.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sidenav/base/basepage.dart';
import 'package:sidenav/pages/register/register_step_2.dart';
import 'package:multi_page_form/multi_page_form.dart';

class RegisterStep2 extends StatefulWidget {
  @override
  _RegisterStep2State createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2> with TickerProviderStateMixin {
 double screenHeight,screenWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return BasePage(
      name: "Register Step 2",
      bodyData: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MultiPageForm(
        totalPage: 3,
        pageList: <Widget>[page1(), page2(), page3()],
        onFormSubmitted: () {
          print("Form is submitted");
        },
    ),
              ]),
    );
  }

   Widget page1() {
      return Container(
        child: ListView(
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              color: Colors.purple,
            ),
            Container(
              height: 20.0,
              width: 20.0,
              color: Colors.blue,
            )
          ],
        ),
      );
    }
  
    Widget page2() {
      return Container(
        child: ListView(
          children: [
            Container(
              height: 200.0,
              width: 200.0,
              color: Colors.yellow,
            )
          ],
        ),
      );
    }
  
    Widget page3() {
      return Container(
        child: ListView(
          children: [
            Container(
              height: 200.0,
              width: 200.0,
              color: Colors.green,
            )
          ],
        ),
      );
    }
}

    