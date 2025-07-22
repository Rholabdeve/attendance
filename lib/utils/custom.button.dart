import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double elevation;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isLoading;
  final bool isSuccess;
  final Color textColor;
  final TextStyle? style;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.elevation = 2.0,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w600,
    this.isLoading = false,
    this.isSuccess = false,
    this.style,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        elevation: MaterialStateProperty.all(elevation),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        padding: MaterialStateProperty.all(padding),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            )
          : Center(
              child: Text(
                text,
                style: style ??
                    TextStyle(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: textColor),
              ),
            ),
    );
  }
}
