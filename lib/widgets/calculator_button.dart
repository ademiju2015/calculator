import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;

  final Function()? onPressed;
  // List of button texts that should not have the orange color
  static const omitColors = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    '.',
  ];
  
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed ,
      style: OutlinedButton.styleFrom(
        // splashFactory: NoSplash.splashFactory,
        elevation: 0,
        
        backgroundColor:
            buttonText == '=' ? Color(0xfff9861b) : const Color(0xFFFFFFFF),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          // side: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(
          color: Colors.white,
          style: BorderStyle.none
        )
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 21,
          color:
              buttonText == '='
                  ? Colors.white
                  : omitColors.contains(buttonText)
                  ? Colors.black
                  : Color(0xfff9861b),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}