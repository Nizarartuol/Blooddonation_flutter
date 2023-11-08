import 'package:flutter/material.dart';
import 'package:new_blood/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_blood/provider/event_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider (
    create: (context) => EventProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Don du sang',
      theme: ThemeData(
        primarySwatch: Colors.red,
        dividerColor: Colors.black,
      ),
      home: LoginScreen()
    ),
    );
}
