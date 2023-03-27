import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:legends_club_tower/game.dart';

class GameManager extends Component with HasGameRef<LegendsClubTower> {
  GameManager();

  ValueNotifier<int> score = ValueNotifier(0);
  ValueNotifier<int> second = ValueNotifier(10);
  Timer? interval;
  final limit = 120;

  GameState state = GameState.intro;

  bool onTime = true;

  bool get isIntro => state == GameState.intro;
  bool get isFeedback => state == GameState.feedback;
  bool get isCollection => state == GameState.collection;
  bool get isPlaying => state == GameState.playing;
  bool get isGameOver => state == GameState.gameOver;

  void reset() {
    score.value = 0;
    onTime = true;
    interval = Timer(
      limit.toDouble(),
      onTick: () => onTime = false,
      repeat: false,
    )..start();
    state = GameState.intro;
  }

  void increaseScore(int quantity) {
    score.value += quantity;
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval?.update(dt);
    second.value = limit - (interval?.current.floor() ?? 0);
  }
}

enum GameState { intro, collection, feedback, playing, gameOver }
