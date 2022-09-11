import 'package:flutter/material.dart';
// import 'package:saldah_shop/app/app_consts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton(
      {super.key,
      required this.text,
      required this.press,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.8,
      // height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              backgroundColor: color),
          onPressed: () {
            press;
          },
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
