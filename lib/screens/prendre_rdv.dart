import 'package:flutter/material.dart';
import 'package:new_blood/fragment/apropos_fragment.dart';
import 'package:new_blood/fragment/historique_fragment.dart';
import 'package:new_blood/fragment/menu_fragment.dart';
import 'package:new_blood/fragment/profile_fragment.dart';
import 'package:new_blood/page/event_editing_page.dart';
import 'package:new_blood/screens/home_screen.dart';
import 'package:new_blood/screens/my_drawer_header.dart';


import '../widgets/calendar_widgets.dart';


class prendrerdv extends StatefulWidget {
  const prendrerdv({Key? key}) : super(key: key);

  @override
  _prendrerdvState createState() => _prendrerdvState();
}

class _prendrerdvState extends State<prendrerdv> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,title: Text("Prendre un rendez-vous !"),
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

      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.red,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EventEditingPage()),
      ),

    ),
    );
  }
}
