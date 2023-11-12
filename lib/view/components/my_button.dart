import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color color;
  final Color textColor;

  const MyButton({
    Key? key,
    this.onTap,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 15.0),
      child: SizedBox(
        width: w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            foregroundColor: Colors.white,
            backgroundColor: color,
            disabledBackgroundColor: Colors.blue,
            disabledForegroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            textStyle: TextStyle(
                fontSize: 16.0, color: textColor, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
