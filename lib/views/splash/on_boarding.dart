import 'package:chatty_app/helper/constants.dart';
import 'package:chatty_app/views/register/login.dart';
import 'package:chatty_app/views/register/signup.dart';
import 'package:chatty_app/widgets/splash/custom_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({super.key});
  static const String id = 'onBoardingScreens';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        // finish button =====> that arrow convert to register button
        finishButtonText: 'Register',

        // navigator of finish button
        onFinish: () => Navigator.pushNamed(context, SignUpScreen.id),

        // finish button style
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),

        // background color of upper screen in the (skip/login) button
        headerBackgroundColor: Colors.white,

        // background color of bottom screen in the (arrow/register) button
        pageBackgroundColor: Colors.white,

        //if true we delete arrow button , slider and we put register buttom from first screen
        hasSkip: true,

        // skip button
        skipTextButton: ElevatedButton(

            // navigation.pushnamed() ====> it navigate by id of screen
            //for more info. go to main.dart
            onPressed: () => Navigator.pushNamed(context, SignUpScreen.id),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            )),

        // login button
        trailing: ElevatedButton(

            // navigation.pushnamed() ====> it navigate by id of screen
            //for more info. go to main.dart
            onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),

        // slider color
        controllerColor: kPrimaryColor,
        background: [
          Image.asset(
            kOnBoardingOne,
            height: 400,
          ),
          Image.asset(kOnBoardingTwo),
          Image.asset(kOnBoardingThree),
        ],
        //speed of background list show in screen
        speed: 1.8,
        totalPage: 3,
        // content of text in every screen
        pageBodies: [
          CustomOnBoarding(
            textOne: 'Chat Anywhere, Anytime',
            textTwo: 'Your Conversations, Your Space.',
          ),
          CustomOnBoarding(
            textOne: 'Express Yourself with Emojis',
            textTwo: 'Where Every Message Brings Joy.',
          ),
          CustomOnBoarding(
            textOne: 'Stickers Speak Louder Than Words',
            textTwo: 'Chat with Personality.',
          ),
        ],
      ),
    );
  }
}
