import 'package:chatty_app/firebase/auth/signup_auth.dart';
import 'package:chatty_app/helper/constants.dart';
import 'package:chatty_app/helper/regexp.dart';
import 'package:chatty_app/views/chat/chat.dart';
import 'package:chatty_app/views/register/login.dart';
import 'package:chatty_app/widgets/register/custom_login_sign_navigate.dart';
import 'package:chatty_app/widgets/register/custom_text_form_field.dart';
import 'package:chatty_app/widgets/register/login_sign_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

//we use this ky in validate
final formKey = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  // for check the icon 'eye' is visible or not
  bool lock = true;
  bool isValid = false;

  // for mange visibilty of password
  bool obsecureText = true;

  //to store value of textFromField in this variables
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        //this widget it takes key and gives to validate
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Image(
                image: AssetImage(kUpperShape),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image(
                  image: AssetImage(kSignImage),
                  width: 250,
                ),
              ),
              const Text(
                'Hello 👋',
                style: TextStyle(fontSize: 30),
              ),

              //custom widget for TextFormField
              CustomTextFormField(
                //email validation rules
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!value.contains('@') || !value.contains('.')) {
                    return 'Write correct email address\nlike : someone@gmail.com';
                  }

                  return null;
                },
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.person),
                //store value in email variable
                onChanged: (value) {
                  email = value;
                },
              ),
              CustomTextFormField(
                validator: (value) {
                  //password validation rules
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'must be greater than 8 charachters';
                  } else if (!smallCharchter.hasMatch(value)) {
                    return 'At least one small charachter';
                  } else if (!capitalCharachter.hasMatch(value)) {
                    return 'At least one capital charachter';
                  } else if (!digits.hasMatch(value)) {
                    return 'At least one number';
                  } else if (!symbols.hasMatch(value)) {
                    return 'At least one special charachter';
                  }
                  return null;
                },
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock),
                onChanged: (value) {
                  password = value;
                },

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
                obscureText: obsecureText,
              ),
              const Gap(10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Gap(70)],
              ),
              const Gap(5),

              //navigation to chat page
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Gap(20),
                  LoginSignButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        isValid = true;
                      }
                      //auth from firebase
                      if (isValid) {
                        await SignUpAuth(context, email!, password!);
                      }
                    },
                  ),
                  const Gap(50),
                ],
              ),
              const Gap(15),

              //navigation to login screen
              CustomLoginSignNavigate(
                onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
                text: 'Already have an account.',
                signOrLogin: 'Login',
              ),
              const Gap(60),
              const Image(
                image: AssetImage(kBottomShape),
              )
            ],
          ),
        ),
      ),
    );
  }
}
