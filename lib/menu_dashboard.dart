import 'package:flutter/material.dart';

final Color bgColor = Color(0xFF2ABBAC);

class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> with TickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth,screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(duration: duration, vsync: this);
    _scaleAnimation = Tween<double>(begin: 1,end:0.85).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5,end:1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1,0),end:Offset(0,0) ).animate(_controller);
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
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
      
    );
  }

  Widget menu(context){
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
                Text("Notifications",style: TextStyle(color: Colors.white,fontSize: 22.0)),
                SizedBox(height: 10.0,),
                Text("Dashboard",style: TextStyle(color: Colors.white,fontSize: 22.0)),
                SizedBox(height: 10.0,),
                Text("CRM",style: TextStyle(color: Colors.white,fontSize: 22.0)),
                SizedBox(height: 10.0,),
                Text("FAQs",style: TextStyle(color: Colors.white,fontSize: 22.0)),
                SizedBox(height: 10.0,),
                Text("Settings",style: TextStyle(color: Colors.white,fontSize: 22.0)),
                SizedBox(height: 10.0,),
              ],
              ),
          ),
      ),
        ),
    );
  }

  Widget dashboard(context){

    return AnimatedPositioned(
         duration: duration,
         top: 0,
         bottom: 0,
         left: isCollapsed ? 0 : 0.6 * screenWidth,
         right:isCollapsed ? 0 : -0.4 * screenWidth,
          child: ScaleTransition(
            scale: _scaleAnimation,
                      child: Material(
        animationDuration: duration,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 8.0,
        color: bgColor,
        child: SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                                      child: Container(
                      padding: EdgeInsets.only(left:16,right:16,top:10.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        InkWell(
                          child: Icon(Icons.menu,color:Colors.white),
                          onTap:(){setState(() {
                            if(isCollapsed)
                               _controller.forward();
                            else
                               _controller.reverse();
                             
                            isCollapsed = !isCollapsed;
                          });},
                        ),
                        // Text("Lotus",style: TextStyle(color:Colors.white,fontSize: 24.0),),
                        Image.asset(
                        "assets/images/logo.png",
                        height: 60.0,
                        ),
                        Icon(Icons.settings,color: Colors.white,)
                      ],   
                ),
                Container(
                      height: screenHeight/4,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal:8),
                            color: Colors.redAccent,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal:8),
                            color: Colors.blue,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal:8),
                            color: Colors.green,
                            width: 100,
                          ),

                        ],
                    ),
                ),
                SizedBox(
                    height: 20,
                ),
                Text("Transactions",style: TextStyle(color: Colors.white,fontSize: 20),),
                ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                    itemBuilder: (context,index){
                    return ListTile(
                      title: Text("Sizzler Buddy"),
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

      ),
          ),
    );

  }
}

