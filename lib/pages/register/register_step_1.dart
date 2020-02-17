import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidenav/base/base.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sidenav/base/basepage.dart';
import 'package:sidenav/pages/register/register_step_2.dart';

class RegisterStep1 extends StatefulWidget {
  @override
  _RegisterStep1State createState() => _RegisterStep1State();
}

class _RegisterStep1State extends State<RegisterStep1>{
  double screenWidth,screenHeight;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
   return BasePage(
      name:"Registration Step 1",
      bodyData: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                          decoration:InputDecoration(
                                // filled: true,
                                // fillColor: Colors.black12,
                                prefixIcon: Icon(Icons.person,size: 20.0,color: white,),
                                hintText: 'Username',
                                // contentPadding:
                                //     const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                          ),
                ),
                Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: Material(
                           elevation: 10.0,
                           shadowColor: shadowBlue,
                           borderRadius: BorderRadius.circular(25.7),
                          child: TextField(
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.person,size: 20.0,color: mainColor,),
                            hintText: 'Username',
                            // contentPadding:
                            //     const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: Material(
                        elevation: 10.0,
                           shadowColor: shadowBlue,
                           borderRadius: BorderRadius.circular(25.7),
                                              child: TextField(
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.person,size: 20.0,color: mainColor,),
                            hintText: 'lastname',
                            // contentPadding:
                            //     const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: Material(
                           elevation: 10.0,
                           shadowColor: shadowBlue,
                           borderRadius: BorderRadius.circular(25.7),
                                              child: TextField(
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.email,size: 20.0,color: mainColor,),
                            hintText: 'Email',
                            // contentPadding:
                            //     const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: Material(
                          elevation: 10.0,
                           shadowColor: shadowBlue,
                           borderRadius: BorderRadius.circular(25.7),
                                              child: TextField(
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.phone,size: 20.0,color: mainColor,),
                            hintText: 'Phone',
                            // contentPadding:
                            //     const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: Material(
                           elevation: 10.0,
                           shadowColor: shadowBlue,
                           borderRadius: BorderRadius.circular(25.7),
                                              child: TextField(
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.lock,size: 20.0,color: mainColor,),
                            hintText: 'Password',
                            // contentPadding:
                            //     const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: Material(
                           elevation: 10.0,
                           shadowColor: shadowBlue,
                           borderRadius: BorderRadius.circular(25.7),
                                              child: TextField(
                          autofocus: false,
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.lock,size: 20.0,color: mainColor,),
                            hintText: 'Confirm Password',
                            // contentPadding:
                            //     const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                                  child: OutlineButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.navigate_next,color: mainColor,),
                      Text("Continue",style: TextStyle(color: mainColor),),
                    ],
                  ),
                  borderSide: BorderSide(color: mainColor),
                  shape: StadiumBorder(),
               ),
                ),

                SizedBox(height: 10.0,),
                Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              width: screenWidth/1.3,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value:true
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'I agree to the Terms of Services',
                      overflow: TextOverflow.ellipsis,
    maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0,),

          Padding(
  padding: EdgeInsets.only(left: 150.0, right: 0.0),
  child: RaisedButton(
    elevation: 0.0,
    textColor: Colors.white,
    color: Colors.black,
    child: Text("Search"),
    onPressed: () {},
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
      side: BorderSide(color: mainColor)
    ),
  ),
),
          
               Center(
                  child: RaisedButton.icon(
                     elevation: 10.0,
                     color: mainColor,
                     splashColor: coolBlue,
                     onPressed: (){
                       print("button clicked");
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterStep2()),
                        );
                     },
                     icon: Icon(Icons.navigate_next,color: white,), 
                     label: Text("Continue",style: TextStyle(color: white),),
                     ),
               ),
                SizedBox(
                        height: 20,
                ),
              ],
              ),
    );
  }
}
