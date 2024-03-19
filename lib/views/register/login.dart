import 'package:chatty_app/firebase/auth/login_auth.dart';
import 'package:chatty_app/helper/constants.dart';
import 'package:chatty_app/views/chat/chat.dart';
import 'package:chatty_app/views/register/signup.dart';
import 'package:chatty_app/widgets/register/custom_login_sign_navigate.dart';
import 'package:chatty_app/widgets/register/custom_text_form_field.dart';
import 'package:chatty_app/widgets/register/login_sign_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // for check the icon 'eye' is visible or not
  bool lock = true;

  // for mange visibilty of password
  bool obsecureText = true;

  //to store value of textFromField in this variables
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // to hide exception of unresponsive ui
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const Image(
              image: AssetImage(kUpperShape),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Image(
                image: AssetImage(kLoginImage),
                width: 250,
              ),
            ),
            const Text(
              'Welcome back 😍',
              style: TextStyle(fontSize: 30),
            ),

            //custom widget for TextFormField
            CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                }

                return null;
              },
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.person),

              // to store value of textFormField in email variable
              onChanged: (value) {
                email = value;
              },
            ),

            //custom widget for TextFormField
            CustomTextFormField(
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Icons.lock),

              //its condition to use icon for make password hide or visible
              suffixIcon: lock == true
                  ? IconButton(
                      onPressed: () {
                        lock = false;
                        obsecureText = false;
                        setState(() {});
                      },
                      icon: const Icon(Icons.visibility_off_outlined))
                  : IconButton(
                      onPressed: () {
                        lock = true;
                        obsecureText = true;
                        setState(() {});
                      },
                      icon: const Icon(Icons.visibility_outlined)),
              //the previous condition it effects on 'obsecureText' variable
              obscureText: obsecureText,
              onChanged: (value) {
                password = value;
              },
            ),
            const Gap(10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Gap(70)],
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                ),
                const Gap(20),

                //button that navigate to chat page
                LoginSignButton(
                  onPressed: () async {
                    await loginAuth(context, email!, password!);
                    Navigator.pushNamed(context, ChatScreen.id,
                        arguments: email);
                  },
                ),
                const Gap(50)
              ],
            ),

            const Gap(20),

            //if you are in login screen and already have an account
            CustomLoginSignNavigate(
              text: 'don\'t have an account',
              signOrLogin: 'Signup',
              onPressed: () => Navigator.pushNamed(context, SignUpScreen.id),
            ),
            const Gap(20),
            const Image(
              image: AssetImage(kBottomShape),
            )
          ],
        ),
      ),
    );
  }
}
