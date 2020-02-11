import 'package:flutter/material.dart';

final Color bgColor = Color(0xFF4A4A58);

class MenuDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    return Padding(
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
    );
  }

  Widget dashboard(context){

    return Material(
      elevation: 8.0,
      color: bgColor,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.menu,color:Colors.white),
              Text("My Cards",style: TextStyle(color:Colors.white,fontSize: 24.0),),
              Icon(Icons.settings,color: Colors.white,)
            ],
            
            
          )

        ],
        ),

    );

  }
  
}

