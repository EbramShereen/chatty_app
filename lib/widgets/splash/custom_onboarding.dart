import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomOnBoarding extends StatelessWidget {
  CustomOnBoarding({
    super.key,
    this.textOne,
    this.textTwo,
    this.textThree,
    this.textOneSize,
    this.textTwoSize,
    this.textThreeSize,
  });
  String id = 'onBoarding';

  String? textOne;
  String? textTwo;
  String? textThree;
  double? textOneSize;
  double? textTwoSize;
  double? textThreeSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 480,
          ),
          Text(
            textOne ?? '',
            style: TextStyle(
              fontSize: textOneSize ?? 20,
              fontFamily: 'Merienda',
            ),
          ),
          const Gap(5),
          Text(
            textTwo ?? '',
            style: TextStyle(
              fontSize: textTwoSize ?? 20,
              fontFamily: 'Merienda',
            ),
          ),
          const Gap(5),
          Text(
            textThree ?? '',
            style: TextStyle(
              fontSize: textThreeSize ?? 20,
              fontFamily: 'Merienda',
            ),
          )
        ],
      ),
    );
  }
}
