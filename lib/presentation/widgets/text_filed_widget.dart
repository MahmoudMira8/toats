import 'package:flutter/material.dart';
import 'package:message_app_training/constans/my-colors.dart';

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 359, 
      child: TextField(
        style: const TextStyle(
          color: MyColors.deepTeal,
          fontSize: 16,
        ),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Enter your phone number',
          hintStyle: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.0,
            color: MyColors.deepTeal,
          ),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ), // ← border-radius
            borderSide: const BorderSide(
              color: Colors.white, // ← border color
              width: 1, // ← border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '+20',
                  style: TextStyle(
                    color: MyColors.deepTeal,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 20,
                  width: 1,
                  color: MyColors.deepTeal,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
