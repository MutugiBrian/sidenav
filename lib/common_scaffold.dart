import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidenav/base/base.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:sidenav/base/basepage.dart';
import 'package:sidenav/pages/register/register_step_1.dart';


class CommonScaffold extends StatefulWidget {
  @override
  _CommonScaffoldState createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold>{
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
                
                LotusCard(
                  context:context,
                  image:"https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  name:"Round the Corner Vastapur",
                  type:"Hotel",
                  location:"London",
                  rating:"4.5"),
                LotusUserCard(
                  context:context,
                  image:"https://i.pinimg.com/originals/a2/c5/ab/a2c5ab8f37a99b3ce16cc0921ec8ac50.jpg",
                  name:"John Doe"
                  ),
                Row(
                    children: <Widget>[
                        LotusUserChip(
                          context:context,
                          image:"https://media-exp1.licdn.com/dms/image/C5603AQGs80XgVG-nxg/profile-displayphoto-shrink_200_200/0?e=1586995200&v=beta&t=XQSVmNAVycY5cSWSkIWELb9NJ-Cwjx2smaH0nclMmpU",
                          name:"Brian"),
                        SizedBox(width: 9.0,),
                        LotusColorChip(
                          context: context,
                          color: mainColor,
                          text: "Confirmed",
                        ),
                        SizedBox(width: 9.0,),
                        LotusColorChip(
                          context: context,
                          color: Colors.red,
                          text: "Pending",
                        ),
                        SizedBox(width: 9.0,),
                        LotusColorChip(
                          context: context,
                          color: coolBlue,
                          text: "View",
                        )
                        

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
    );
  }
}


