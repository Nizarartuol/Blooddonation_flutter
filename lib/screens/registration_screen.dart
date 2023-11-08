import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_details.dart';
import 'home_screen.dart';

    class RegistrationScreen extends StatefulWidget {
      const RegistrationScreen({Key? key}) : super(key: key);

      @override
      _RegistrationScreenState createState() => _RegistrationScreenState();
    }

    class _RegistrationScreenState extends State<RegistrationScreen> {

      final _auth = FirebaseAuth.instance;


      // our form key
      final _formKey = GlobalKey<FormState>();
      //editing Controller
      final nomCompletEditingController = new TextEditingController();
      final bloodTypeEditingController = new TextEditingController();
      final emailEditingController = new TextEditingController();
      final motdepasseEditingController = new TextEditingController();
      final confirmermotdepasseEditingController = new TextEditingController();
      final numerotelephoneEditingController = new TextEditingController();

  get errorMessage => null;

      @override
      Widget build(BuildContext context) {
        // Nom Complet field
        final nomCompletField = TextFormField(
          autofocus: false,
          controller: nomCompletEditingController,
          keyboardType: TextInputType.name,
          validator: (value) {
            RegExp regex = RegExp(r'^.{2,}$');
            if (value!.isEmpty) {
              return ("Le champ ne peut pas être vide");
            }
            if (!regex.hasMatch(value)) {
              return ("Entrer un nom valide (Min. 2 caractère)");};
          },
          onSaved: (value)
          {
            nomCompletEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              contentPadding: EdgeInsets.fromLTRB(20, 15,20,15),
              hintText: "Nom Complet",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        );

        // bloodType field
        final bloodTypeField = TextFormField(
          autofocus: false,
          controller: bloodTypeEditingController,
          keyboardType: TextInputType.name,
          validator: (value) {
            RegExp regex = RegExp(r'^.{2,}$');
            if (!regex.hasMatch(value!)) {
              return ("Entrer votre type du sang");
            }
            return null;
          },
          onSaved: (value)
          {
            bloodTypeEditingController.text = value!;

          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.bloodtype),
              contentPadding: EdgeInsets.fromLTRB(20, 15,20,15),
              hintText: "Type du sang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
          ),
        );

        // email field
        final emailField = TextFormField(
          autofocus: false,
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
        validator: (value) {
        if (value!.isEmpty) {
        return ("Entrer votre email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
        return ("Entrer un email valide");
        }
        return null;
        },
          onSaved: (value)
          {
            emailEditingController.text = value!;

          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              contentPadding: EdgeInsets.fromLTRB(20, 15,20,15),
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        );

        // motdepasse field
        final motdepasseField = TextFormField(
          autofocus: false,
          controller: motdepasseEditingController,
          obscureText: true,
        validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
        return ("Le mot de passe est requis pour la connexion");
        }
        if (!regex.hasMatch(value)) {
        return ("Entrer un mot de passe valide (Min. 6 caractère )");
        }
        return null;
        },
          onSaved: (value)
          {
            motdepasseEditingController.text = value!;

          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              contentPadding: EdgeInsets.fromLTRB(20, 15,20,15),
              hintText: "Mot de passe",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        );

        // confirmer mot de passe field
        final confirmermotedepasseField = TextFormField(
          autofocus: false,
          controller: confirmermotdepasseEditingController,
          obscureText: true,
        validator: (value) {
        if (confirmermotdepasseEditingController.text != motdepasseEditingController.text) {
        return "Le mot de passe n'est pas le même";
        }
        return null;
        },
          onSaved: (value)
          {
            confirmermotdepasseEditingController.text = value!;
          },
          textInputAction: TextInputAction.done ,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              contentPadding: EdgeInsets.fromLTRB(20, 15,20,15),
              hintText: "Confirmer Mot De Passe",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        );

        // numero de telephone field
        final numerotelephoneField = TextFormField(
          autofocus: false,
          controller: numerotelephoneEditingController,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Entrer votre numéro");
            }
            // reg expression for phone validation
            if (!RegExp("^[0-9]")
                .hasMatch(value)) {
              return ("Entrer un numéro valide");
            }
            return null;
          },
          onSaved: (value)
          {
            numerotelephoneEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              contentPadding: EdgeInsets.fromLTRB(20, 15,20,15),
              hintText: "Numero de telephone",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
        );


        //sinscire button
        final sinscrireButton = Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          color: Colors.redAccent,
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              signUp(emailEditingController.text, motdepasseEditingController.text);
            },
            child: const Text("S'inscrire",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold
              ),),
          ),
        );


        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
           backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.red),
              onPressed: ()
              {
                //passing this to our root
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: 200,
                              child: Image.asset("assets/logo.png",
                                fit: BoxFit.contain,)
                          ),
                          const SizedBox(height: 45),

                          nomCompletField,
                          const SizedBox(height: 20),

                          bloodTypeField,
                          const SizedBox(height: 20),

                          emailField,
                          const SizedBox(height: 20),

                          motdepasseField,
                          const SizedBox(height: 20),

                          confirmermotedepasseField,
                          const SizedBox(height: 20),

                          numerotelephoneField,
                          const SizedBox(height: 20,),

                          sinscrireButton,
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  )
              ),
            ),
          ),
        );
      }
      void signUp(String email, String password) async {
        if (_formKey.currentState!.validate()) {
          try {
            await _auth
                .createUserWithEmailAndPassword(email: email, password: password)
                .then((value) => {postDetailsToFirestore()})
                .catchError((e) {
              Fluttertoast.showToast(msg: e!.message);
            });
          } on FirebaseAuthException catch (error) {
            Fluttertoast.showToast(msg: errorMessage!);
            print(error.code);
          }
        }
      }
      postDetailsToFirestore() async {
        // calling our firestore
        // calling our user model
        // sending these values

        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        User? user = _auth.currentUser;

        UserModel userModel = UserModel();

        // writing all the values
        userModel.email = user!.email;
        userModel.uid = user.uid;
        userModel.nomcomplet = nomCompletEditingController.text;
        userModel.typedesang = bloodTypeEditingController.text;
        userModel.numerotelephone = numerotelephoneEditingController.text;

        await firebaseFirestore
            .collection("users")
            .doc(user.uid)
            .set(userModel.toMap());
        Fluttertoast.showToast(msg: "Compte créé avec succès: ");

        Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
      }
    }

