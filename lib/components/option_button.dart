import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.colors,
    required this.size,
    required this.onPressed,
    required this.child,
  });

  final void Function() onPressed;
  final Widget child;
  final double size;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(width: 3, color: Colors.white)),
          child: child,
        ));
  }
}
