import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_auth_with_g10/services/util_service.dart';

final class AuthService{

  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?>registerUser(BuildContext context, {required String fullName, required String email, required String password})async{
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user?.updateDisplayName(fullName);
      if(userCredential.user != null){
        return userCredential.user;
      }else{
        return null;
      }
    }catch(e){
      Utils.fireSnackBar("$e", context);
      return null;
    }
  }


  static Future<User?>loginUser(BuildContext context, {required String email, required String password})async{
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        return userCredential.user;
      }else{
        return null;
      }
    }catch(e){
      Utils.fireSnackBar("$e", context);
      return null;
    }

  }

  static Future<void> deleteAccount()async{
    await auth.currentUser?.delete();
  }

  static Future<void> logOut()async{
    await auth.signOut();
  }


}