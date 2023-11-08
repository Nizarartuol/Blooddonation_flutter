import 'package:flutter/material.dart';

class historique extends StatefulWidget {
  const historique({Key? key}) : super(key: key);

  @override
  _localisationScreenState createState() => _localisationScreenState();
}

class _localisationScreenState extends State<localisationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(12), child: displayHistory(),
        ),
      ),
    );
  }
}