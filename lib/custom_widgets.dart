import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final double imgHeight;
  HeroImage({this.imgHeight});

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset('images/new.png'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}


class CustomButton extends StatelessWidget {
  final String btn_text;
  final Function onBtnPressed;

  CustomButton({this.btn_text, this.onBtnPressed});



  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btn_text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 10.0,),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
      onPressed: onBtnPressed,
      color: Theme.of(context).buttonColor,
    );
  }
}


