import 'package:chatty_app/firebase_options.dart';
import 'package:chatty_app/views/chat/chat.dart';
import 'package:chatty_app/views/register/login.dart';
import 'package:chatty_app/views/register/signup.dart';
import 'package:chatty_app/views/splash/on_boarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChattyApp());
}

class ChattyApp extends StatelessWidget {
  const ChattyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Merienda',
      ),
      //for navigator between screens by put in every screen an id
      routes: {
        SignUpScreen.id: (context) => const SignUpScreen(),
        OnBoardingScreens.id: (context) => const OnBoardingScreens(),
        LoginScreen.id: (context) => const LoginScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
      //it's like 'home' but use routes to show first screen
      initialRoute: OnBoardingScreens.id,
    );
  }
}
