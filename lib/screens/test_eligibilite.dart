
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:new_blood/common/colors.dart';
import 'package:new_blood/data/info_group.dart';
import 'home_screen.dart';


class test extends StatelessWidget {


  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .headline6;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        title: Text("Suis-je éligible ?"),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            //passing this to our root
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...InfoGroup.whoCanDonate
                  .map(
                    (g) => ExpansionTile(
                  title: Text(g.title, style: titleStyle),
                  initiallyExpanded: g.id == 0,
                  children: g.info
                      .map(
                        (c) => ListTile(
                      leading: const Icon(Icons.bookmark),
                      title: Text(c),
                    ),
                  )
                      .toList(),
                ),
              )
                  .toList(),

            ],
          ),
        ),
      ),
    );
  }
}

