import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoggy/views/home_page/widgets/interaction_background.dart';
import 'package:lottie/lottie.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   var interactionReference = [];
  @override
  void initState() {
    super.initState();
     readJsonData();

  }
   readJsonData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/json/interaction_reference.json");
    final jsonResult = jsonDecode(data);
    print("hi");
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
        child:interactionReference.length<=0? Center(child: CircularProgressIndicator()):
        Stack(
          children: [
            InteractionBackground(interactionReference[0]["attrs"]),
          ],
        ),
      ),

    );
  }
}




