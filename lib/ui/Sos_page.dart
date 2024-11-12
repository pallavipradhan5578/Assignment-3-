import 'package:assignment2/utils/app_color.dart';
import 'package:assignment2/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar()),
      body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Don't warry",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "We are here to help you.",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getDashbaordCard(
                          title: 'Medicle\nEmergency',
                          image: 'assets/icons/call.png'),
                      getDashbaordCard(
                          title: 'Safe\nSpeces', image: 'assets/icons/home.png'),
                      getDashbaordCard(
                          title: 'People\nNearby', image: 'assets/icons/location.png')
                    ],
                  )
                ],
              ),
            ),
          SizedBox(height: 30,),
            Expanded(child: 
          
          Container(
            width: MediaQuery.of(context).size.width/1,
            decoration: 
            BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(74),
                topRight: Radius.circular(74),

              ),
              color: AppColor.primaryBlue
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column
                (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Click to send an alert',
                textAlign: TextAlign.center,
                style: TextStyle(

                    color:AppColor.whiteColor,fontSize: 20,fontWeight: FontWeight.w900
                ),),
                  // SizedBox(height: 50,),
                  Container(
                    height: MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.height/4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:AppColor.redColor
                    ),
                    alignment: Alignment.center,
                    child: Text("SOS",
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w800
                    ),
                    ),
                  ),
                  // SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/icons/location_icon.png',
                        height: 61,
                          width: 47,
                        ),
                        Image.asset('assets/icons/message.png',
                          height: 51,
                          width: 68,
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          )
          
          )

          ],
        ),

    );
  }
}
