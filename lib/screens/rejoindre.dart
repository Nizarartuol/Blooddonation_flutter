import 'package:flutter/material.dart';

import 'home_screen.dart';

class rejoindre extends StatefulWidget {
  const rejoindre({Key? key}) : super(key: key);

  @override
  _rejoindreState createState() => _rejoindreState();
}

class _rejoindreState extends State<rejoindre> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,title: Text("Rejoindre des équipes !"),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: ()
          {
            //passing this to our root
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
    );
  }
}
