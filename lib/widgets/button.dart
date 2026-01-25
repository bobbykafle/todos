import 'package:flutter/material.dart';
class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  const CustomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    
    });

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed, //now it uses the function passed
                style: ElevatedButton.styleFrom(
                  backgroundColor:backgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
  }
}