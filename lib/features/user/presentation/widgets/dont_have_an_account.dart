import 'package:event/config/app_style.dart';
import 'package:event/features/user/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String buttonText;

  const DontHaveAccount(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppStyle.smallGreyext,
        ),
        CustomTextButton(onPressed: onPressed, text: buttonText)
      ],
    );
  }
}
