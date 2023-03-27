import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legends_club_tower/game.dart';

import 'package:legends_club_tower/gen/assets.gen.dart';
import 'package:legends_club_tower/utils/num_utils.dart';

class GameOverlay extends StatelessWidget {
  const GameOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            (game as LegendsClubTower).objectManager.changeColor(-1);
          } else if (details.primaryVelocity! < 0) {
            (game as LegendsClubTower).objectManager.changeColor(1);
          }
        },
        onVerticalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            (game as LegendsClubTower).objectManager.dropDown();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.game.left.image(
                      width: 34,
                      height: 34,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Assets.images.game.right.image(
                      width: 34,
                      height: 34,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 260),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable:
                            (game as LegendsClubTower).gameManager.second,
                        builder: (context, value, child) {
                          return Counter(
                            text: value.formatTime(),
                            colors: [Color(0xff00F3C1), Color(0xff00D0A4)],
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      ValueListenableBuilder(
                        valueListenable:
                            (game as LegendsClubTower).gameManager.score,
                        builder: (context, value, child) {
                          return Counter(
                            text: value.toString().padLeft(4, '0'),
                            colors: [Color(0xffFF4329), Color(0xffDC190A)],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.text,
    required this.colors,
  });

  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 64,
      width: 164,
      child: Stack(
        alignment: Alignment.centerRight,
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            right: -3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(width: 3, color: Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
