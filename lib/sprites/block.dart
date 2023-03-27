import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:legends_club_tower/game.dart';

class BlockSprite extends PositionComponent
    with CollisionCallbacks, HasGameRef<LegendsClubTower> {
  BlockSprite({
    required this.colors,
    super.position,
  }) : super(
          anchor: Anchor.center,
          priority: 1,
        );

  List<Color> colors;
  bool isFalling = false;
  bool isOnGround = false;
  int direction = 1;
  final horizontalSpeed = 196;
  final horizontalOffset = 80;

  final moveUpSpeed = -120;
  bool needMoveUp = false;
  late final double originY;

  double verticalSpeed = 1024;
  late final minX, maxX;
  final Paint paint = Paint();
  late RectangleHitbox hitbox;

  @override
  Future<void> onLoad() async {
    hitbox = RectangleHitbox()..collisionType = CollisionType.active;
    add(hitbox);
    size = Vector2(164, 40);
    minX = horizontalOffset + size.x / 2;
    maxX = gameRef.size.x - size.x / 2 - horizontalOffset;

    originY = position.y;
  }

  @override
  void update(double dt) async {
    super.update(dt);
    if (needMoveUp) {
      position.y += moveUpSpeed * dt;
      if (position.y < originY - 120) {
        // stop move up
        position.y = originY - 120;
        needMoveUp = false;
      }
    }
    if (isOnGround) {
    } else if (isFalling) {
      position.y += verticalSpeed * dt;
    } else {
      position.x += horizontalSpeed * direction * dt;

      position.x = position.x.clamp(minX, maxX).toDouble();
      if (position.x == maxX || position.x == minX) {
        direction *= -1;
      }
    }
  }

  @override
  void render(Canvas canvas) async {
    super.render(canvas);
    paint
      ..shader = Gradient.linear(
          Offset(size.x / 2, 0), Offset(size.x / 2, size.y), colors);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is BlockSprite && hitbox.collisionType == CollisionType.active) {
      hitbox.collisionType = CollisionType.passive;
      isOnGround = true;
      position.y = other.position.y - size.y;
    } else if (other is ScreenHitbox && !isOnGround) {
      hitbox.collisionType = CollisionType.passive;
      isOnGround = true;
      position.y = gameRef.size.y - size.y / 2;
    }
  }
}
