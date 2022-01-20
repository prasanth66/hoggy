import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class InteractionBackground extends StatefulWidget {
  const InteractionBackground(this.backgroundDetails,{Key? key}) : super(key: key);
  final backgroundDetails ;

  @override
  _InteractionBackgroundState createState() => _InteractionBackgroundState();
}

class _InteractionBackgroundState extends State<InteractionBackground> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                for(var data in widget.backgroundDetails["backgroundColor"]["breakPoints"] ) HexColor(data["color"])
              ],
          )
      ),
      child:  Lottie.network(
        widget.backgroundDetails["lottieBackground"]["asset"],
        width: widget.backgroundDetails["size"]["width"].toDouble(),
        height: widget.backgroundDetails["size"]["height"].toDouble(),
        fit: BoxFit.cover,
      ),
    );
  }
}
