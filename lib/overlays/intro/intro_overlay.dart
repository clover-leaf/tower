import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_club_tower/app/app.dart';
import 'package:legends_club_tower/components/components.dart';
import 'package:legends_club_tower/game.dart';

import 'package:legends_club_tower/gen/assets.gen.dart';

class IntroOverlay extends StatelessWidget {
  const IntroOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final soundOn = context.select((SettingCubit cubit) => cubit.state.soundOn);
    final bestScore =
        context.select((SettingCubit cubit) => cubit.state.bestScore);

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.intro.overlay.image(fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OptionButton(
                      onPressed: () =>
                          context.read<SettingCubit>().toogleAudio(),
                      size: 70,
                      colors: [Color(0xffFF4329), Color(0xffDC190A)],
                      child: soundOn
                          ? Assets.images.intro.volume
                              .image(color: Colors.white, width: 32, height: 32)
                          : Assets.images.intro.mute.image(
                              color: Colors.white, width: 32, height: 32),
                    ),
                    OptionButton(
                      onPressed: () => {},
                      size: 70,
                      colors: [Color(0xffFF4329), Color(0xffDC190A)],
                      child: Assets.images.intro.chat
                          .image(color: Colors.white, width: 32, height: 32),
                    ),
                  ],
                ),
                SizedBox(height: 96),
                BestScore(bestScore: bestScore),
                SizedBox(height: 196),
                OptionButton(
                  onPressed: () async =>
                      await (game as LegendsClubTower).start(),
                  size: 100,
                  colors: [Color(0xff00F3C1), Color(0xff00D0A4)],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Assets.images.intro.playButton.image(
                      color: Colors.white,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                SizedBox(height: 64),
                OptionButton(
                  onPressed: () => {},
                  size: 100,
                  colors: [Color(0xff00F3C1), Color(0xff00D0A4)],
                  child: Assets.images.intro.collection.image(
                    color: Colors.white,
                    width: 80,
                    height: 80,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
