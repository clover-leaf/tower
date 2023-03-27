import 'package:flutter/material.dart';

class BackToPreviousButton extends StatelessWidget {
  const BackToPreviousButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Back',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 42,
                  color: Color(0xffBFAB9D)),
            ),
          ),
        ],
      ),
    );
  }
}
