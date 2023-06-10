import 'package:event/config/app_style.dart';
import 'package:flutter/material.dart';

class SucessErrorAlertDialog extends StatelessWidget {
  final String text;
  const SucessErrorAlertDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                child: const Icon(Icons.close)),
            const Text(
              "Error",
              style: AppStyle.boldErrorText,
            ),
            Text(text),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'))
      ],
    );
  }
}
