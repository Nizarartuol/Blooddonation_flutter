import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class apropos extends StatefulWidget {
  const apropos({Key? key}) : super(key: key);

  @override
  _aproposState createState() => _aproposState();

}

class _aproposState extends State<apropos> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Column(
          children: const <Widget> [
            Text(" Les donneurs de sang donnent du sang pour diverses raisons, y compris : \n", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text("- Un ami leur a demandé \n"
                "- Ils savent qu'un être cher a beaucoup besoin de sang \n "
                "- Ils croient que c'est la bonne chose à faire \n", style: TextStyle(fontSize: 16),),

            Divider(
              color: Colors.black54,
              thickness: 1.0,
            ),

            Text(" Vous n'avez pas besoin d'une raison particulière pour donner du sang. \n"
                "Tu as juste besoin de ta propre raison. \n", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(" - Quelle que soit votre raison, le besoin est constant et votre contribution est importante pour un approvisionnement en sang sain et fiable. Et vous vous sentirez bien en sachant que vous avez contribué à changer une vie. \n" ,
              style: TextStyle(fontSize: 16),),

            Divider(
              color: Colors.black54,
              thickness: 1.0,
            ),

            Text("Vous recevrez un mini-examen physique pour vérifier votre : \n", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text("- Impulsion \n"
                "- Pression artérielle \n "
                "- Température corporelle\n", style: TextStyle(fontSize: 16),),
            Divider(
              color: Colors.black54,
              thickness: 0.5,
            ),


          ],
        ),
      ),
    );


  }
}
