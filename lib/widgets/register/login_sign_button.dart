import 'package:chatty_app/helper/constants.dart';
import 'package:flutter/material.dart';

class LoginSignButton extends StatelessWidget {
  LoginSignButton({super.key, required this.onPressed});

  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        overlayColor: MaterialStatePropertyAll(kPrimaryColor),
        backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
        surfaceTintColor: MaterialStatePropertyAll(kPrimaryColor),
        enableFeedback: false,
      ),
      child: Container(
          width: 64,
          height: 40,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
    );
  }
}
