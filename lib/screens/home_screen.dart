import 'package:flutter/material.dart';
import 'package:new_blood/fragment/apropos_fragment.dart';
import 'package:new_blood/fragment/historique_fragment.dart';
import 'package:new_blood/fragment/menu_fragment.dart';
import 'package:new_blood/fragment/profile_fragment.dart';
import 'package:new_blood/screens/my_drawer_header.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

// page selected
int indexPage = 0;
  final List fragments = const [
    menupage(),
    historique(),
    profile(),
    apropos(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,title: Text("Don De Sang !"),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(
            Icons.menu,
          ),
        ),
      ),
      drawer: MyHeaderDrawer(
        onMenuTap: (page) {
          print(page);
          Navigator.pop(context);
          setState(() {
            indexPage = page;
          });
        },
      ),
      body: fragments[indexPage],
    );
  }
}
