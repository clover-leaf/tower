import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestScore extends StatelessWidget {
  const BestScore({
    super.key,
    required this.bestScore,
  });

  final int bestScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFF4329), Color(0xffDC190A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(width: 3, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Best: $bestScore',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
