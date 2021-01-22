import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quatro_app/custom_widgets.dart';
import 'package:quatro_app/login.dart';

class IntroPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body:Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              child: HeroImage(imgHeight: MediaQuery.of(context).size.height*0.7,)
          ),

          Positioned(
            bottom: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.3,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child:  Column(
                children: [
                  Text(
                    'LeanQuatro',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 20.0,),



                  CustomButton(btn_text: 'Get Started', onBtnPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return Login();
                    })
                    );
                  },),



                ],
              ),

            ),
          ),

        ],
      ),
    );
  }
}