import 'dart:developer';

import 'package:chatty_app/components/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> loginAuth(
    BuildContext context, String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    showSnackBar(context, 'Success');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      log(e.code);
      showSnackBar(context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      log(e.code);
      showSnackBar(context, 'Wrong password provided for that user.');
    }
  }
  Catch(e) {
    log(e.toString());
    showSnackBar(context, 'There was an error , try later.');
  }
}
