import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart' as rootBundle;



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late var interactionReference ;
  @override
  void initState() {
    super.initState();
    interactionReference = ReadJsonData();

  }
  Future<List> ReadJsonData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/json/interaction_reference.json");
    final jsonResult = jsonDecode(data);
    return jsonResult;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),

    );
  }
}




