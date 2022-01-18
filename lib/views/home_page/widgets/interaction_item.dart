import 'package:flutter/material.dart';
    

class InteractionItem extends StatefulWidget {
  const InteractionItem(this.itemDetails,{Key? key}) : super(key: key);
  final itemDetails;
  @override
  _InteractionItemState createState() => _InteractionItemState();
}

class _InteractionItemState extends State<InteractionItem> {

  Widget CutomTextWidget(){
    return  Positioned(
        top: widget.itemDetails["y"].toDouble(),
        left: widget.itemDetails["x"].toDouble(),
        child: Text(
          widget.itemDetails["text"].toString(),
          style: TextStyle(
              fontSize: widget.itemDetails["fontSize"].toDouble(),
              fontWeight: widget.itemDetails["bold"]==true?FontWeight.bold:FontWeight.normal,
              fontStyle: widget.itemDetails["italic"]==false?FontStyle.normal:FontStyle.italic,
              color: const Color.fromRGBO(255, 255, 255, 1)

          ),
        )
    );
  }
  Widget CustomImageWidget(){
    return Positioned(
      top: widget.itemDetails["y"].toDouble(),
      left: widget.itemDetails["x"].toDouble(),
      child:Image.network(
        widget.itemDetails["src"].toString(),
        width:widget.itemDetails["width"].toDouble(),
        height:widget.itemDetails["height"].toDouble(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return widget.itemDetails["type"]=="text"?CutomTextWidget():CustomImageWidget();
  }
}





