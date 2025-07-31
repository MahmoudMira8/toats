import 'package:flutter/material.dart';
import 'package:message_app_training/constans/my-colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: SizedBox(
          width: 216,
          height: 37,
          child: ElevatedButton(
            onPressed: () {
              // Handle login action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.deepTeal,
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              elevation: 0,
            ),
            child: const Text(
              'LOG IN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.9,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
