import 'package:flame/collisions.dart';
import 'package:flame/game.dart' hide Route;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legends_club_tower/app/cubit/setting_cubit.dart';
import 'package:legends_club_tower/overlays/overlays.dart';

import 'managers/managers.dart';
import 'world.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  static Route<void> route() {
    final Game game = LegendsClubTower();
    return MaterialPageRoute<void>(
      builder: (context) => BlocProvider(
        create: (context) => SettingCubit()..initial(),
        child: GameWidget(
          game: game,
          overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
            'introOverlay': (_, game) => IntroOverlay(game),
            'gameOverOverlay': (_, game) => GameOverOverlay(game),
            'gameOverlay': (_, game) => GameOverlay(game),
            'collectionOverlay': (_, game) => CollectionOverlay(game),
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class LegendsClubTower extends FlameGame with HasCollisionDetection {
  final World world = World();
  GameManager gameManager = GameManager();
  ObjectManager objectManager = ObjectManager();

  @override
  Future<void> onLoad() async {
    // await Flame.device.fullScreen();
    // await Flame.device.setLandscape();
    add(ScreenHitbox());

    camera.speed = 120;

    await add(world);

    await add(gameManager);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameManager.isGameOver) {
      return;
    }

    if (gameManager.isIntro) {
      addIntro();
      return;
    }
    if (gameManager.isPlaying) {
      if (!objectManager.isValidMove || !gameManager.onTime) {
        objectManager.isValidMove = false;
        gameManager.interval?.pause();
        camera.snapTo(Vector2(0, 0));
        onLose();
      }
    }
  }

  Future<void> initializeGameStart() async {
    gameManager.reset();
    objectManager.reset();

    if (children.contains(objectManager)) objectManager.removeFromParent();

    objectManager = ObjectManager();

    await add(objectManager);
  }

  void onLose() {
    gameManager.state = GameState.gameOver;
    addGameOver();
  }

  Future<void> start() async {
    await initializeGameStart();
    removeIntro();
    addPlaying();
    gameManager.state = GameState.playing;
  }

  Future<void> restart() async {
    await initializeGameStart();
    removeGameOver();
    gameManager.state = GameState.playing;
  }

  void overToIntro() {
    removePlaying();
    removeGameOver();
    addIntro();
    gameManager.state = GameState.intro;
  }

  void introToCollection() {}

  void collectionToIntro() {}

  void introToFeedback() {}

  void feedbackToIntro() {}

  void addPlaying() {
    if (!overlays.isActive('gameOverlay')) {
      overlays.add('gameOverlay');
    }
  }

  void removePlaying() {
    if (overlays.isActive('gameOverlay')) {
      overlays.remove('gameOverlay');
    }
  }

  void addIntro() {
    if (!overlays.isActive('introOverlay')) {
      overlays.add('introOverlay');
    }
  }

  void removeIntro() {
    if (overlays.isActive('introOverlay')) {
      overlays.remove('introOverlay');
    }
  }

  void addGameOver() {
    if (!overlays.isActive('gameOverOverlay')) {
      overlays.add('gameOverOverlay');
    }
  }

  void removeGameOver() {
    if (overlays.isActive('gameOverOverlay')) {
      overlays.remove('gameOverOverlay');
    }
  }
}
