import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

Future signInAuth(String _email, String _password, BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    FirebaseUser user = result.user;
    Navigator.pushReplacementNamed(context, '/home');
    return user.uid;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future signUpAuth(String _email, String _password) async {
  FirebaseAuth _signUp = FirebaseAuth.instance;
  try {
    AuthResult result = await _signUp.createUserWithEmailAndPassword(
        email: _email, password: _password);
    FirebaseUser user = result.user;
    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

//function used in reports.
Future readData() async {
  return await Firestore.instance.collection('').getDocuments();
}

//function used to perform search queries
Future getData() async {
  return await Firestore.instance
      .collection('')
      .where('Uid', isEqualTo: '')
      .getDocuments();
}

class CrudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(db) async {
    if (isLoggedIn()) {
      return await Firestore.instance
          .collection('key_book')
          .add(db)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You are not logged in');
    }
  }

  Future<void> addVisitor(db, String idNumber) async {
    if (isLoggedIn()) {
      return await Firestore.instance
          .collection('visitors')
          .document(idNumber)
          .setData(db)
          .catchError((e) {
        print(e);
      });
    }
  }

  Future<void> addVisits(db) async {
    if (isLoggedIn()) {
      return await Firestore.instance
          .collection('visits')
          .add(db)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You are not logged in');
    }
  }
}
