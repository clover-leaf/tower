import 'package:dotted_line/dotted_line.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legends_club_tower/app/app.dart';
import 'package:legends_club_tower/components/components.dart';

import 'package:legends_club_tower/game.dart';
import 'package:legends_club_tower/gen/assets.gen.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final bestScore =
        context.select((SettingCubit cubit) => cubit.state.bestScore);
    

    return Material(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: (game as LegendsClubTower).gameManager.score,
                builder: (context, value, child) {
                  return Text(
                    '$value',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: DottedLine(
                  dashColor: Color(0xff00F3C1),
                  dashLength: 16,
                  dashGapLength: 16,
                  lineThickness: 4,
                ),
              ),
              const SizedBox(height: 32),
              BestScore(bestScore: 120),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionButton(
                    onPressed: () => (game as LegendsClubTower).overToIntro(),
                    size: 70,
                    colors: [Color(0xff00F3C1), Color(0xff00D0A4)],
                    child: Assets.images.gameOver.home
                        .image(color: Colors.white, width: 32, height: 32),
                  ),
                  OptionButton(
                    onPressed: () => (game as LegendsClubTower).restart(),
                    size: 70,
                    colors: [Color(0xffFF4329), Color(0xffDC190A)],
                    child: Assets.images.gameOver.update
                        .image(color: Colors.white, width: 32, height: 32),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
