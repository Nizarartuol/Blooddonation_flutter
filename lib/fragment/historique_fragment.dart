import 'package:flutter/material.dart';

class historique extends StatefulWidget {
  const historique({Key? key}) : super(key: key);

  @override
  _historiqueState createState() => _historiqueState();
}

class _historiqueState extends State<historique> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(12),child: displayHistory(),
        ),
      ),
    );
  }

  displayHistory(){
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context,index){
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(22))),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(children: [
                        Text("Date"),
                        Text("Lundi 27 juillet", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                      ],),

                      Column(children: [
                        Text('Heure', style:TextStyle(fontWeight: FontWeight.bold)),
                        Text('9:30 - 10:00', style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                      ],
                      ),
                    ],
                    ),

                    Divider(thickness: 1,),
                    Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Centre agdal', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                          Text('A+', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                        ],
                      )],)
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: const [
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Détails', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),)
                ],),
              )
            ],
          ),
        );
      },
    );
  }
}