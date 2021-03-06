
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;

  String get getUid => _uid;

  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async{
    bool _retVal = false;

    try{
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      if(_authResult.user != null ){
        return _retVal = true;
      }

    }catch(e){
      print(e);
    }
    return _retVal;

  }

  Future<bool> loginUser(String email, String password) async{
    bool _retVal = false;

    try{
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(_authResult.user != null ){
        _uid = _authResult.user.uid;
        _email = _authResult.user.email;
        return _retVal = true;
      }

    }catch(e){
      print(e);
    }
    return _retVal;
  }
}
