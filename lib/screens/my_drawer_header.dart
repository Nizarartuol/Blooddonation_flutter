import 'package:flutter/material.dart';
import 'package:new_blood/screens/login_screen.dart';
import 'package:new_blood/widgets/app_text_normal.dart';
import 'package:new_blood/fragment/apropos_fragment.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_plus/share_plus.dart';

import '../model/user_details.dart';


class MyHeaderDrawer extends StatefulWidget {

  //getting selected menu to home page
final Function(int) onMenuTap;

  const MyHeaderDrawer({Key? key,
    required this.onMenuTap
  }) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {

  //initiale index
  int initialIndex = 0;

  // active and inactive styles

  final activeTextStyle = TextStyle(color: Colors.white);
  final inactiveTextStyle = TextStyle(color: Colors.black);
  final activeDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: Colors.redAccent,
  );

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  final List<String> menus = [
    "Menu",
    "Historique",
    "Profile",
    "A propos",
  ];

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.history,
    Icons.person,
    Icons.feedback_outlined,
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/profiile.png",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                ),
              ),
              Padding(
               padding: EdgeInsets.only(left: 10.0),
               child: AppTextNormal(
                 text: " ${loggedInUser.nomcomplet}",
                 color: Colors.black,
                 size: 25,
               ),
             ),

            ],
          ),
          const SizedBox(
            height: 20,
          ),


// Generating menus
        Column(
          children: List.generate(
            menus.length,
              (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                  decoration: initialIndex == index ? activeDecoration: BoxDecoration() ,
                  child: ListTile(
                    onTap: () {
                     // print("$index" + menus[index]);
                      setState(() {
                        initialIndex = index;
                      });
                      widget.onMenuTap(index);
                    },
                    title: Text(menus[index], style: initialIndex == index ? activeTextStyle : inactiveTextStyle),
                    leading: Icon(icons[index],color: initialIndex == index ? Colors.white : Colors.black),
                  ),
                ),
              );
              },
          ),
        ),
          SizedBox(
            height: 20,
          ),

          const Divider(
            color: Colors.black54,
            thickness: 0.5,
          ),



          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 20),
            child: Text("Documentation"),
          ),

          ListTile(
            title: Text("Politique de Confidentialité"),
            leading: Icon(Icons.security_outlined),
          ),
          ListTile(
            title: Text("Partager !"),
            leading: Icon(Icons.share),
            onTap: () async {
             await Share.share("Voici votre meilleure application pour pouvoir faire un don du sang");
            },
          ),
          ListTile(
            title: Text("Se déconnecter"),
            leading: Icon(Icons.logout, color: Colors.red),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),


        ],
      ),
    );
  }
}
