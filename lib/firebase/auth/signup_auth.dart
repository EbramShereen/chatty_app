import 'dart:developer';

import 'package:chatty_app/components/show_snack_bar.dart';
import 'package:chatty_app/views/chat/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> SignUpAuth(
    BuildContext context, String email, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    showSnackBar(context, 'Success');
    Navigator.pushNamed(context, ChatScreen.id, arguments: email);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      log(e.code);
      showSnackBar(context, 'Weak password');
    } else if (e.code == 'email-already-in-use') {
      log(e.code);
      showSnackBar(context, 'Email already in use');
    }
  } catch (e) {
    log(e.toString());
  }
}
