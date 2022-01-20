import 'dart:ffi';

import 'package:flutter/material.dart';

    

class InteractionItem extends StatefulWidget {
  const InteractionItem(this.itemDetails,{Key? key}) : super(key: key);
  final itemDetails;
  @override
  _InteractionItemState createState() => _InteractionItemState();
}

class _InteractionItemState extends State<InteractionItem> {
 late var screenSize;
  Widget CutomTextWidget(){
    return  Positioned(
        top: (screenSize.height) * (widget.itemDetails["y"].toDouble()/500),
        left: (screenSize.width) * (widget.itemDetails["x"].toDouble()/900),
        child: Text(
          widget.itemDetails["text"].toString(),
          textScaleFactor: widget.itemDetails["fontSize"].toDouble()/100,
          style: TextStyle(
              fontSize: widget.itemDetails["fontSize"].toDouble(),
              fontWeight: widget.itemDetails["bold"]==true?FontWeight.bold:FontWeight.normal,
              fontStyle: widget.itemDetails["italic"]==false?FontStyle.normal:FontStyle.italic,
              color: const Color.fromRGBO(255, 255, 255, 1),


          ),
        )
    );
  }
  Widget CustomImageWidget(){

    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      curve: Curves.bounceOut,
      tween: Tween<double>(begin: 0.0,end:(screenSize.height) * (widget.itemDetails["y"].toDouble()/500), ),
      builder: (BuildContext context, double value, Widget? child) {
        return Positioned(
          top:value,
          left: (screenSize.width) * (widget.itemDetails["x"].toDouble()/900),
          child:Image.network(
            widget.itemDetails["src"].toString(),
            width:screenSize.width * (widget.itemDetails["width"].toDouble()/900),
            height:screenSize.height * (widget.itemDetails["height"].toDouble()/500),
          ),
        );
      },

    );
  }
  @override
  Widget build(BuildContext context) {
     screenSize = MediaQuery.of(context).size;
    return widget.itemDetails["type"]=="text"?CutomTextWidget():CustomImageWidget();
  }
}





