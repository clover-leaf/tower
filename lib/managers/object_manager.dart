import 'dart:math';
import 'dart:ui';

import 'package:legends_club_tower/game.dart';
import 'package:legends_club_tower/sprites/block.dart';
import 'package:legends_club_tower/utils/utils.dart';
import 'package:flame/components.dart';

final Random _rand = Random();

class ObjectManager extends Component with HasGameRef<LegendsClubTower> {
  ObjectManager();

  final probGen = ProbabilityGenerator();
  final List<BlockSprite> _blocks = [];
  final List<Color> originColors = [
    Color(0xff00F3C1),
    Color(0xffFF4329),
    Color(0xffffffff),
  ];
  late List<List<Color>> colors;
  int colorIndex = 0;
  bool isValidMove = true;
  double _yOffset = 80;

  @override
  void onMount() {
    super.onMount();
    colors = originColors.combination<Color>();
    _generateNewBlock(_yOffset);
  }

  void _generateNewBlock(double yOffset, [bool? needMoveUp]) {
    colors.shuffle();
    colorIndex = _rand.nextInt(colors.length);
    final colorPair = colors[colorIndex];
    final block = BlockSprite(
        colors: colorPair,
        position: Vector2(
          gameRef.size.x / 2,
          yOffset,
        ))
      ..needMoveUp = needMoveUp ?? false;
    _blocks.add(block);
    add(block);
  }

  void changeColor(int delta) {
    if (_blocks.isNotEmpty &&
        !_blocks.last.isFalling &&
        !_blocks.last.isOnGround) {
      colorIndex =
          (colorIndex + delta + colors.length).remainder(colors.length);
      final colorPair = colors[colorIndex];
      _blocks.last.colors = colorPair;
    }
  }

  void dropDown() {
    if (_blocks.isNotEmpty && !_blocks.last.needMoveUp) {
      _blocks.last.isFalling = true;
    }
  }

  void reset() {
    clearAll();
    isValidMove = true;
  }

  void clearAll() {
    for (final block in _blocks) {
      remove(block);
    }
    _blocks.clear();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!isValidMove) {
      if (_blocks.isNotEmpty) {
        clearAll();
      }
      return;
    }
    if (_blocks.isNotEmpty && _blocks.last.isOnGround) {
      final l = _blocks.length;
      if (l > 1) {
        final cur = _blocks[l - 1];
        final prv = _blocks[l - 2];
        if (cur.y >= prv.y || cur.colors[1] != prv.colors[0]) {
          isValidMove = false;
          return;
        }
      }
      gameRef.gameManager.increaseScore(5);
      if (_blocks.length >= 6 && _blocks.length.remainder(3) == 0) {
        gameRef.camera.translateBy(Vector2(0, -40 * 3));
        _generateNewBlock(_yOffset, true);
        _yOffset -= 40 * 3;
      } else {
        _generateNewBlock(_yOffset);
      }
    }
  }
}
