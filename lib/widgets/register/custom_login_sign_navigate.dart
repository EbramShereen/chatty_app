import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomLoginSignNavigate extends StatelessWidget {
  CustomLoginSignNavigate(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.signOrLogin});
  String text;
  String signOrLogin;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
        const Gap(5),

        //button that navigate to signup page
        TextButton(
          onPressed: onPressed,
          child: Text(
            signOrLogin,
            style: const TextStyle(color: Colors.blueAccent),
          ),
        ),
        const Gap(60)
      ],
    );
  }
}
