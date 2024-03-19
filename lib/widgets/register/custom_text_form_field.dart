import 'package:chatty_app/helper/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.validator,
    this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.controller,
    this.onFieldSubmitted,
  });
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  TextEditingController? controller;
  Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
      child: TextFormField(
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        obscureText: obscureText ?? false,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, strokeAlign: 100)),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
