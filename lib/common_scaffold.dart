import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidenav/base/base.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:sidenav/pages/register/register_step_1.dart';

class CommonScaffold extends StatefulWidget {
  @override
  _CommonScaffoldState createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> with TickerProviderStateMixin {
  bool isCollapsed = true;
  bool collapseFromLeft = true;
  double screenWidth,screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;


  Animation cardAnimation, delayedCardAnimation, fabButtonanim, infoAnimation;
  AnimationController controller;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(duration: duration, vsync: this);
    _scaleAnimation = Tween<double>(begin: 1,end:0.85).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5,end:1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1,0),end:Offset(0,0) ).animate(_controller);

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: controller));

    fabButtonanim = Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));


  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: <Widget>[
          lotusguestmenu(context),
          dashboard(context),
        ],
      ),
      
    );
  }

    Widget lotusguestmenu(context){
    return SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: Padding(
          padding: const EdgeInsets.only(left:16.0),
          child: Align(
               alignment: Alignment.centerLeft,
                child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Stack(
                  children: <Widget>[

                     Container(
                                      height: screenHeight/5,
                                      width: screenWidth/1.8,
                                      child: FittedBox(
                                           child: new FloatingActionButton(
                                          heroTag: "btn1",
                                          elevation: 5.0,
                                          backgroundColor: mainColor,
                                          onPressed: (){},
                                          child:  Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: new Container(
             width: screenHeight/9,
             height: screenHeight/9,
             child:
                new Image.asset(Base.logo),
           ),
                                          ),
                                      ),
                                    )
                  ),
                 Container(
      margin: EdgeInsets.only(top:screenHeight/6),
      width: screenWidth/1.8,
        child: Material(
        color: Colors.white,
        elevation: 20.0,
        shadowColor: Color(0x802196F3),
        borderRadius: BorderRadius.circular(5.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                                          child: Text(
                        "Guest",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ),
                  ],
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.location_on,color:mainColor,),
                    Text("London, England"),
                  ],
              ),
            ],
          ),
        ),
        )),

                  ],
                ),
               
                 SizedBox(
                   height: 10.0,
                 ),
                 Container(
                  height: screenHeight/20,
    
                  child: FlatButton.icon(
                     onPressed:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterStep1()),
                        );
                      }, 
                     icon: Icon(FontAwesomeIcons.userPlus,color: Colors.blueAccent,size: 20.0,), 
                     label: Text("Create Account",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/22,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(FontAwesomeIcons.lock,color: Colors.blueAccent,size: 20.0,), 
                     label: Text("Login",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/16,
                  width: screenWidth/1.8,
                  child: RaisedButton.icon(
                    elevation: 0.0,
                    color: Colors.blue,
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.facebook,color: white,), 
                    label: Text("Sign in with Facebook",style: TextStyle(color: white),)
                    )
                )
                ,
                SizedBox(height: 10.0,),
                Container(
                  height: screenHeight/16,
                  width: screenWidth/1.8,
                  child: RaisedButton.icon(
                    elevation: 0.0,
                    color: Colors.red,
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.googlePlus,color: white,), 
                    label: Text("Sign in with Google+",style: TextStyle(color: white),)
                    )
                )
                ,
                SizedBox(height: 10.0,),
                Container(
                  width: screenWidth/1.8,
                  height: screenHeight/16,
                  child: RaisedButton.icon(
                    elevation: 0.0,
                    color: coolBlue,
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.twitter,color: white,), 
                    label: Text("Sign in with Twitter",style: TextStyle(color: white),)
                    )
                )
                ,
               
                SizedBox(height: 10.0,),
              ],
              ),
          ),
      ),
        ),
    );
  }

  Widget lotusmenu(context){
    return SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: Padding(
          padding: const EdgeInsets.only(left:16.0),
          child: Align(
               alignment: Alignment.centerLeft,
                child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Stack(
                  children: <Widget>[

                     Container(
                                      height: screenHeight/5,
                                      width: screenWidth/1.8,
                                      child: FittedBox(
                                           child: new FloatingActionButton(
                                          heroTag: "btn2",
                                          elevation: 5.0,
                                          backgroundColor: white,
                                          onPressed: (){},
                                          child:  Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: new Container(
             width: screenHeight/9,
             height: screenHeight/9,
             decoration: new BoxDecoration(
               color: mainColor,
               image: new DecorationImage(
                //  https://pixinvent.com/materialize-material-design-admin-template/app-assets/images/user/12.jpg
                // https://media-exp1.licdn.com/dms/image/C5603AQGs80XgVG-nxg/profile-displayphoto-shrink_200_200/0?e=1586995200&v=beta&t=XQSVmNAVycY5cSWSkIWELb9NJ-Cwjx2smaH0nclMmpU
                     image: new NetworkImage("https://pixinvent.com/materialize-material-design-admin-template/app-assets/images/user/12.jpg"),
                     fit: BoxFit.cover,
               ),
               borderRadius: new BorderRadius.all(
                     new Radius.circular(screenHeight/4)
                     ),
              //  border: new Border.all(
              //        color: mainColor,
              //        width: 4.0,
              //  ),
             ),
           ),
                                          ),
                                      ),
                                    )
                  ),
                 Container(
      margin: EdgeInsets.only(top:screenHeight/6),
      width: screenWidth/1.8,
        child: Material(
        color: Colors.white,
        elevation: 20.0,
        shadowColor: Color(0x802196F3),
        borderRadius: BorderRadius.circular(5.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                                          child: Text(
                        "Jane Doe",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ),
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                          children: <Widget>[
                            Icon(Icons.star,color: Colors.purpleAccent,size: 18.0,),
                            Icon(Icons.star,color: Colors.purpleAccent,size: 18.0,),
                            Icon(Icons.star,color: Colors.purpleAccent,size: 18.0,),
                            Icon(Icons.star,color: Colors.purpleAccent,size: 18.0,),
                            Icon(Icons.star,color: Colors.purpleAccent,size: 18.0,),
                            Text("5.0",style: TextStyle(color: Colors.black),),
                          ],
                        ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.location_on,color:mainColor,),
                    Text("London, England"),
                  ],
              ),
            ],
          ),
        ),
        )),

                  ],
                ),
               
                 SizedBox(
                   height: 10.0,
                 ),
                 Container(
                  height: screenHeight/20,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(Icons.settings,color: Colors.blueAccent,size: 22.0,), 
                     label: Text("Account Settings",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/22,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(Icons.dashboard,color: Colors.blueAccent,size: 22.0,), 
                     label: Text("Dashboard",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/22,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(Icons.notifications,color: Colors.blueAccent,size: 22.0,), 
                     label: Text("Notifications",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/22,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(FontAwesomeIcons.qrcode,color: Colors.blueAccent,size: 22.0,), 
                     label: Text("Scan Qr",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/22,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(Icons.computer,color: Colors.blueAccent,size: 22.0,), 
                     label: Text("Epos",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/22,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(FontAwesomeIcons.calculator,color: Colors.blueAccent,size: 22.0,), 
                     label: Text("CRM",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/22,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(FontAwesomeIcons.briefcase,color: Colors.blueAccent,size: 22.0,), 
                     label: Text("Services",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                Container(
                  width: screenWidth/1.8,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                  height: screenHeight/22,
                  child: FlatButton.icon(
                     onPressed: (){}, 
                     icon: Icon(FontAwesomeIcons.questionCircle,color: Colors.blueAccent,size: 26.0,), 
                     label: Text("FAQs",style: TextStyle(color: white,fontSize: 15.0),)
                     ),
                ),
                SizedBox(height: 10.0,),
              ],
              ),
          ),
      ),
        ),
    );
  }
  
  Widget lotusbottom(context){
    return Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
        height: screenHeight/15,
        child: BottomAppBar(
          color: mainColor,
          child: 
              ListView(
                scrollDirection: Axis.horizontal,
              children:[
                FlatButton(
                  textColor:Colors.white,
                  onPressed: (){},
                  padding: EdgeInsets.all(2.0),
                  child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(
                      Icons.home,
                        size: 22.0,
                        ),
                    Text("Home",
                        style: TextStyle(fontSize: 12.0),
                        )
                  ],
                ),
                ),
                FlatButton(
                  textColor:Colors.white,
                  onPressed: (){},
                  padding: EdgeInsets.all(2.0),
                  child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(
                      Icons.notifications,
                        size: 22.0,
                        ),
                    Text("Alerts",
                        style: TextStyle(fontSize: 12.0),
                        )
                  ],
                ),
                ),
                FlatButton(
                  textColor:Colors.white,
                  onPressed: (){},
                  padding: EdgeInsets.all(2.0),
                  child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(
                      Icons.person,
                        size: 22.0,
                        ),
                    Text("Profile",
                        style: TextStyle(fontSize: 12.0),
                        )
                  ],
                ),
                ),
                FlatButton(
                  textColor:Colors.white,
                  onPressed: (){},
                  padding: EdgeInsets.all(2.0),
                  child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(
                      Icons.add,
                        size: 22.0,
                        ),
                    Text("Add",
                        style: TextStyle(fontSize: 12.0),
                        )
                  ],
                ),
                ),
                FlatButton(
                  textColor:Colors.white,
                  onPressed: (){},
                  padding: EdgeInsets.all(2.0),
                  child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(
                      Icons.home,
                        size: 22.0,
                        ),
                    Text("Home",
                        style: TextStyle(fontSize: 12.0),
                        )
                  ],
                ),
                ),
                
                              ]),
              
              
            
        ),
      ),
    );
  }

  Widget lotusheader(context){
    return  Container(
      color: mainColor.withOpacity(0.979),
      height: screenHeight/14,
      child: Padding(
        padding: const EdgeInsets.only(right:8.0,left: 8.0),
        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                        
                          children: <Widget>[
                            InkWell(
                              child: Icon(
                                Icons.menu,
                                color:Colors.white,
                                size: 27.0,
                                ),
                              onTap:(){setState(() {
                                collapseFromLeft = true;
                                if(isCollapsed)
                                   _controller.forward();
                                else
                                   _controller.reverse();
                                 
                                isCollapsed = !isCollapsed;
                              });},
                            ),
                            // Text("Lotus",style: TextStyle(color:Colors.white,fontSize: 24.0),),
                            Image.asset(
                            Base.logo,
                            height: screenHeight/8.8,
                            ),
                            InkWell(
                                 child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 27,
                                ),
                                onTap: (){setState(() {
                                collapseFromLeft = false;
                                if(isCollapsed)
                                   _controller.forward();
                                else
                                   _controller.reverse();
                                 
                                isCollapsed = !isCollapsed;
                              });},
                            )
                          ],   
                    ),
      ),
    );
  }
    Widget lotususercard(context,image,name){

    return Container(
      margin: EdgeInsets.only(bottom:13),
        child: Material(
        color: Colors.white,
        elevation: 10.0,
        shadowColor: Color(0x802196F3),
        borderRadius: BorderRadius.circular(5.0),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: screenHeight/6,
              child: Stack(
                children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                    color:mainColor,
                    height: screenHeight/18,
                    padding: EdgeInsets.only(left:screenWidth/3.5) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Row(
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(fontWeight: FontWeight.bold,color:white),
                              ),
                              SizedBox(
                                width:10.0
                              ),
                              Text("4.5",style: TextStyle(color: white),),
                              Icon(Icons.star,color: Colors.purpleAccent,size: 16.5,),
                          ],
                        ),
                        Icon(FontAwesomeIcons.ellipsisV,color: Colors.white,size: 15.0,)
                      ])
                    ),
                    Container(
                    height: screenHeight/18,
                    padding: EdgeInsets.only(left:screenWidth/3.5) ,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        Icon(
                          Icons.email,
                          color: mainColor,
                          ),
                        SizedBox(width: 5.0,),
                        Text("johndoe@gmail.com",style: TextStyle(color: Colors.black),),
                        SizedBox(
                          width: 28.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0,left: 7.0),
                          child: FloatingActionButton(
                            heroTag: "btn3",
                            backgroundColor: mainColor,
                            onPressed: (){},
                            elevation: 0.0,
                            child: Icon(Icons.phone,size: 16.0,)
                            ),
                        )
                      ])
                    ),
                    Container(
                    height: screenHeight/18,
                    padding: EdgeInsets.only(left:screenWidth/4) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        // Row(
                        //   children: <Widget>[
                        //     Icon(Icons.star,color: Colors.purpleAccent,),
                        //     Icon(Icons.star,color: Colors.purpleAccent,),
                        //     Icon(Icons.star,color: Colors.purpleAccent,),
                        //     Icon(Icons.star,color: Colors.purpleAccent,),
                        //     Icon(Icons.star,color: Colors.purpleAccent,),
                        //     Text("5.0",style: TextStyle(color: Colors.black),),
                        //   ],
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(2.0),
                        //   child: FloatingActionButton(
                        //     heroTag: "btn3",
                        //     backgroundColor: mainColor,
                        //     onPressed: (){},
                        //     elevation: 0.0,
                        //     child: Icon(Icons.phone,size: 18.0,)
                        //     ),
                        // )
                        
                      ])
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                                    child: 
                                    Container(
                                      height: screenHeight/3,
                                      child: FittedBox(
                                           child: new FloatingActionButton(
                                          heroTag: "btn4",
                                          elevation: 0.0,
                                          backgroundColor: mainColor,
                                          onPressed: (){},
                                          child:  Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: new Container(
             width: screenHeight/7,
             height: screenHeight/7,
             decoration: new BoxDecoration(
               color: mainColor,
               image: new DecorationImage(
                     image: new NetworkImage(image),
                     fit: BoxFit.cover,
               ),
               borderRadius: new BorderRadius.all(
                     new Radius.circular(screenHeight/4)
                     ),
              //  border: new Border.all(
              //        color: mainColor,
              //        width: 4.0,
              //  ),
             ),
           ),
                                          ),
                                      ),
                                    )
          //                           new Container(
          //    width: screenHeight/7,
          //    height: screenHeight/7,
          //    decoration: new BoxDecoration(
          //      color: mainColor,
          //      image: new DecorationImage(
          //            image: new NetworkImage(image),
          //            fit: BoxFit.cover,
          //      ),
          //      borderRadius: new BorderRadius.all(
          //            new Radius.circular(screenHeight/4)
          //            ),
          //      border: new Border.all(
          //            color: mainColor,
          //            width: 4.0,
          //      ),
          //    ),
          //  ),
                  ),
                ),
                )
                ],
              ),
            )
          ),
        ),

      ),
    );
  }
  Widget lotususerchip(context){
    return ActionChip(
      elevation: 5,
      avatar:  new Container(
             width: screenHeight/2,
             height: screenHeight/2,
             decoration: new BoxDecoration(
               color: mainColor,
               image: new DecorationImage(
                     image: new NetworkImage("https://media-exp1.licdn.com/dms/image/C5603AQGs80XgVG-nxg/profile-displayphoto-shrink_200_200/0?e=1586995200&v=beta&t=XQSVmNAVycY5cSWSkIWELb9NJ-Cwjx2smaH0nclMmpU"),
                     fit: BoxFit.cover,
               ),
               borderRadius: new BorderRadius.all(
                     new Radius.circular(screenHeight/4)
                     ),
              //  border: new Border.all(
              //        color: mainColor,
              //        width: 4.0,
              //  ),
             ),
           ),
      label: Text("Brian"),
      onPressed: (){}
      );
  }
   Widget lotuscolorchip(context,color,text){
    return ActionChip(
      elevation: 5,
      backgroundColor: color,
      label: Text(text,style: TextStyle(color: white),),
      onPressed: (){}
      );
  }

  Widget lotuscard(context,image,name,type,location,rating){

    return Container(
      margin: EdgeInsets.only(bottom:13),
        child: Material(
        color: Colors.white,
        elevation: 10.0,
        shadowColor: Color(0x802196F3),
        borderRadius: BorderRadius.circular(5.0),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: screenWidth-10,
                  height:screenHeight/2.58,
                  child: Stack(
                                      children:[ 
                                        Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                                width: screenWidth-10,
                                height:screenHeight/3.3,
                                decoration: BoxDecoration(
                                   // borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: new NetworkImage(image),
                                        fit: BoxFit.cover)),
                                
                              ),
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Container(
                                height: 30.0,
                                margin: EdgeInsets.only(left:10.0),
                                child: Chip(
                                  //backgroundColor: Colors.white.withOpacity(0.9),
                                  elevation: 0.0,
                                  //avatar: Icon(Icons.location_on,size: 15.0,),
                                  label: Text(location)
                                  ),

                              ),
                                IconButton(
                                   color: Colors.white.withOpacity(0.6),
                                   icon: Icon(Icons.favorite,color: Colors.pink),
                                   onPressed: (){})
                                // FlatButton.icon(
                                //   onPressed: (){},
                                //   color: Colors.white.withOpacity(0.6),
                                //   icon: Icon(Icons.favorite,color: Colors.pink), 
                                //   label: Text("")
                                //   )
                                
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             mainAxisSize: MainAxisSize.max,
                             children: <Widget>[
                                      Container(
                                        width: screenWidth-110,
                                        child: Row(
                          children:[
                            //Icon(Icons.restaurant,color: Colors.brown,),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              name,
                              style:TextStyle(fontWeight: FontWeight.bold))
                          ]
                        ),
                                      ),
                        Container(
                          width: screenWidth-110,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                            Container(
                                //width: screenWidth-110,
                                padding: EdgeInsets.only(left:11.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:[
                                    
                                    Text(rating),
                                    Icon(Icons.star,color: mainColor,size: 16.5,),
                                  ]
                                ),
                              ),
                             // Icon(Icons.accessibility,color: Colors.purpleAccent,),
                             SizedBox(
                              width: 4.0,
                            ),
                              Text(
                                type,
                                style:TextStyle(
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black54
                                   )
                              )
                            ]
                          ),
                        ),
                        

                        
                             ],
                            ),
                            
                            
                          ],
                        ),

                        

                        

                        

                        

                      ],
                    ),
                    Container(
                            margin: EdgeInsets.only(top:screenHeight/3.65,left: screenWidth/1.3),
                            height: screenHeight/15,
                            child: FloatingActionButton(
                              heroTag: "btn5",
                              elevation: 0.0,
                              onPressed: (){},child:Icon(Icons.bubble_chart,color: Colors.white,)))
                                      ]
                  ),
                ),
                
              ],
            ),
          ),
        ),

      ),
    );
    // Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Container(
    //                 padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
    //                 child: Stack(
    //                   overflow: Overflow.visible,
    //                   children: <Widget>[
    //                     Positioned(
    //                       child: Container(
    //                         transform: Matrix4.translationValues(0.0, delayedCardAnimation.value * screenHeight, 0.0),
    //                         width: screenWidth,
    //                         height:screenHeight/3.3,
    //                         decoration: BoxDecoration(
    //                             color: Colors.amber,
    //                             borderRadius: BorderRadius.circular(10.0)),
    //                       ),
    //                     ),
                       
    //                     Container(
    //                       width: screenWidth,
    //                       height:screenHeight/3.3,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                           image: DecorationImage(
    //                               image: AssetImage(Base.logo),
    //                               fit: BoxFit.cover)),
    //                     ),
    //                     Positioned(
    //                       top: screenHeight/4.3,
    //                       left: 15.0,
    //                       child: Container(
    //                         transform: Matrix4.translationValues(0.0, infoAnimation.value * screenHeight, 0.0),
    //                         width: screenWidth/1.3,
    //                         height: screenHeight/4,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(10.0),
    //                             color: Colors.white,
    //                             boxShadow: [
    //                               BoxShadow(
    //                                   blurRadius: 1.0,
    //                                   color: Colors.black12,
    //                                   spreadRadius: 2.0)
    //                             ]),
    //                         child: Container(
    //                           padding: EdgeInsets.all(4.0),
    //                           child: Column(
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             children: <Widget>[


    //                               Row(
    //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                 children: <Widget>[
    //                                   Text(
    //                                     'Kayla',
    //                                     style: TextStyle(
    //                                         fontFamily: 'Montserrat',
    //                                         fontSize: 20.0),
    //                                   ),
    //                                   SizedBox(width: 4.0),
    //                                   SizedBox(width: 110.0),
    //                                   Text(
    //                                     '5.8km',
    //                                     style: TextStyle(
    //                                         fontFamily: 'Montserrat',
    //                                         fontSize: 20.0,
    //                                         color: Colors.grey),
    //                                   ),
    //                                 ],
    //                               ),
    //                               SizedBox(height: 9.0),
    //                               Row(
    //                                 children: <Widget>[
    //                                   Text(
    //                                     'Fate is wonderful.',
    //                                     style: TextStyle(
    //                                         fontFamily: 'Montserrat',
    //                                         fontSize: 15.0,
    //                                         color: Colors.grey),
    //                                   )
    //                                 ],
    //                               ),
    //                               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   IconButton(icon: Icon(Icons.edit,color: Colors.green,), onPressed: (){}),
    //                   IconButton(icon: Icon(Icons.favorite,color: Colors.pink,), onPressed: (){})
    //                 ],
    //               ),


    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 )),
                
    //           ]);
  }

  Widget dashboard(context){

    return AnimatedPositioned(
         duration: duration,
         top: 0,
         bottom: 0,
         
         left:
              collapseFromLeft ?
              ( isCollapsed ? 0 : 0.6 * screenWidth)
              :
              (isCollapsed ? 0 : -0.4 * screenWidth)
         ,
         right:
              collapseFromLeft ?
              (  isCollapsed ? 0 : -0.4 * screenWidth)
              :
              (isCollapsed ? 0 : 0.6 * screenWidth)
             ,
        //  right: ,
        //  left:isCollapsed ? 0 : -0.4 * screenWidth,
          child: ScaleTransition(
            scale: _scaleAnimation,
            //Hero targeted here
                      child: Material(
        animationDuration: duration, 
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 8.0,
        color: mainColor,
        child: SafeArea(
                    child: Stack(
                                          children:[ 

                                            Padding(
                      padding: EdgeInsets.only(top: screenHeight/14),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                      child: Container(
                            color:white,
                            padding: EdgeInsets.only(left:4,right:4,top:0.0),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                lotuscard(context,"https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","Round the Corner Vastapur","Hotel","London","4.5"),
                lotuscard(context,"https://www.herbusiness.co.ke/wp-content/uploads/2017/10/Wholesale-and-Retail-Sestor-in-Kenya-800x548.jpg","Naivas Supermarket","Venue","Nairobi","4.0"),
                // lotuscard(context,"https://images.all-free-download.com/images/graphicthumb/food_picture_03_hd_pictures_167556.jpg","Chicken"),
                // lotuscard(context,"https://cdn.guidingtech.com/imager/assets/189867/HD-Mouth-Watering-Food-Wallpapers-for-Desktop-10_4d470f76dc99e18ad75087b1b8410ea9.jpg?1573743473","Seafood"),
                // lotuscard(context,"https://i.pinimg.com/originals/a2/c5/ab/a2c5ab8f37a99b3ce16cc0921ec8ac50.jpg","Burger"),
                // lotuscard(context,"https://i.pinimg.com/originals/a2/c5/ab/a2c5ab8f37a99b3ce16cc0921ec8ac50.jpg","Cake"),
                lotususercard(context,"https://i.pinimg.com/originals/a2/c5/ab/a2c5ab8f37a99b3ce16cc0921ec8ac50.jpg","John Doe"),
                Row(
                    children: <Widget>[
                        lotususerchip(context),
                        SizedBox(width: 9.0,),
                        lotuscolorchip(context, mainColor, "Confirmed"),
                        SizedBox(width: 9.0,),
                        lotuscolorchip(context, Colors.red, "Pending"),
                        SizedBox(width: 9.0,),
                        lotuscolorchip(context, coolBlue, "View"),
                        

                    ],
                ),
                SizedBox(height: 10.0,),

                
                

                SizedBox(
                          height: 20,
                ),
                Text("Menu Items",style: TextStyle(color: Colors.white,fontSize: 20),),
                ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                          itemBuilder: (context,index){
                          return ListTile(
                            title: Text("Cream Roll"),
                            subtitle: Text("booking"),
                            trailing: Text("200"),
                          );
                }, 
                separatorBuilder: (context,index){
                           return Divider(height: 16);
                },
                 itemCount: 10
                )

               

              ],
              ),
                          ),
                        ),
                                            ),
                                             lotusheader(context),
                                             lotusbottom(context)
                                          ]
                    ),
                  ),
        ),

      ),
    );

  }
}

