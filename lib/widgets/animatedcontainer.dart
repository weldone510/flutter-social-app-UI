import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimateContainer extends StatefulWidget {
  @override
  _AnimateContainerState createState() => _AnimateContainerState();
}

class _AnimateContainerState extends State<AnimateContainer> {
  static double maxSize = 300;
  Color color = Colors.green;
  double height = maxSize;
  double width = maxSize;
  BorderRadius borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black.withOpacity(0.4),
          width: maxSize,
          height: maxSize,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInExpo,
            height: maxSize,
            width: maxSize,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: color,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          onPressed: () {
            final random=Random();
            final red = random.nextInt(255);
            final green = random.nextInt(255);
            final blue= random.nextInt(255);
            final color=Color.fromRGBO(red, green, blue, 1);
            final borderNumber = random.nextInt(255);
            final borderRadius=BorderRadius.circular(borderNumber.toDouble());
            setState(() {
              this.color=color;
              this.borderRadius=borderRadius;
            });
          },
          shape: StadiumBorder(),
          color: Colors.red,
          child: Text('Do Magic',style: TextStyle(color: Colors.white),),
        )
      ],
    );
  }
}
