import 'package:attendancce/shared/theme_style.dart';
import 'package:flutter/material.dart';

class ButtonSecondaryDark extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const ButtonSecondaryDark({
    Key key,
    this.title,
    this.width = double.infinity,
    this.height = 48,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: primaryDarken_2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          title,
          style: whiteText.copyWith(
            fontSize: 14,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}

class ButtonPrimaryDark extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const ButtonPrimaryDark({
    Key key,
    this.title,
    this.width = double.infinity,
    this.height = 48,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: primaryLighten_5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          title,
          style: primaryClrText.copyWith(
            fontSize: 14,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}

class ButtonTextOnly extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const ButtonTextOnly({
    Key key,
    this.title,
    this.width = double.infinity,
    this.height = 24,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(),
        child: Text(
          title,
          style: primaryClrText.copyWith(
            fontSize: 14,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}

class ButtonPrimaryClr extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const ButtonPrimaryClr({
    Key key,
    this.title,
    this.width = double.infinity,
    this.height = 48,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          title,
          style: whiteText.copyWith(
            fontSize: 14,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}
