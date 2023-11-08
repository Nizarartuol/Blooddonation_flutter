import 'package:intl/intl.dart';

class UserModel {
  String? uid;
  String? email;
  String? nomcomplet;
  String? typedesang;
  String? numerotelephone;

  UserModel({this.uid, this.email, this.nomcomplet, this.typedesang, this.numerotelephone});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      nomcomplet: map['nomcomplet'],
      typedesang: map['typedesang'],
      numerotelephone: map['numerotelephone'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nomcomplet': nomcomplet,
      'typedesang': typedesang,
      'numerotelephone' : numerotelephone,
    };
  }
}