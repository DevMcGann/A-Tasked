import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

Widget header(BuildContext context, String image, String title, double fontSize, double headerSize) {
    return ClipPath(
      clipper: BezierClipper(),
        child: Container(
          color : Color.fromRGBO(0, 149, 255, 1),
          height: MediaQuery.of(context).size.height * headerSize,
          child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Opacity(
                            opacity: 0.40,
                            child: Image.asset(image, fit:BoxFit.contain),
                            )
                          ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              child: BorderedText(
                                  strokeWidth: 9,
                                  strokeColor: Colors.blue,
                                  child: Text(title, style: TextStyle(
                                  fontSize: fontSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ChewyRegular'
                                  
                                ),
                                ),
                              ),
                              ),
                          ],
                        ),
                      ]
          ),
        ),
      ); 
  }

class BezierClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
  Path path = new Path();
  path.lineTo(0, size.height*0.70); //vertical line
  path.quadraticBezierTo(size.width/2, size.height, size.width, size.height*0.70); //quadratic curve
  path.lineTo(size.width, 0); //vertical line
  return path;
}
@override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}