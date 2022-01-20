import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoggy/views/home_page/widgets/interaction_background.dart';
import 'package:hoggy/views/home_page/widgets/interaction_item.dart';
import 'package:lottie/lottie.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   var interactionReference = [];
   int index = 0 ;
  @override
  void initState() {
    super.initState();
     readJsonData();

  }
  onButtonClick(){
    setState(() {
      index = (index+1)%(interactionReference.length);
    });
  }
   readJsonData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/json/interaction_reference.json");
    final jsonResult = jsonDecode(data);
    setState(() {
      interactionReference = jsonResult;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: EdgeInsets.all(16),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            interactionReference.length<=0? Center(child: CircularProgressIndicator()):
            Expanded(
              child: Stack(
                children: [
                  InteractionBackground(interactionReference[index]["attrs"],),
                  for(var item in interactionReference[index]["children"] ) InteractionItem(item)
                ],
              ),
            ),
            SizedBox(width: 16,),
            CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
              child:IconButton(
                  onPressed: onButtonClick,
                  icon: Icon(Icons.arrow_forward)
              )
            )
          ],
        )
      ),

    );
  }
}




