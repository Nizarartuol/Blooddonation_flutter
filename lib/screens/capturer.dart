import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_blood/screens/home_screen.dart';
import 'package:share/share.dart';

class capturer extends StatefulWidget {

  @override
  _capturerState createState() => _capturerState();
}

class _capturerState extends State<capturer> {

 File? imageFile;

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,title: Text("Capturer le moment !"),
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
      body: ListView(
        children: [
          SizedBox( height: 50,),
          imageFile != null ?
              Container(
                child: Image.file(imageFile!),
              ):

        Container(
          child: Icon(
            Icons.camera_enhance,
            color: Colors.green,
            size: MediaQuery.of(context).size.width*.6,
          ),
        ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: Text("Capturer votre Don"),
              onPressed: () {
                _getFromCamera();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              child: Text("Partager !"),
              onPressed: () {
                Share.share("https://play.google.com/store/apps/details?id=com.instructivetech.testapp");
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
              ),

            ),
          )


        ],
      ),
    );
  }
}
