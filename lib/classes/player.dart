import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/services.dart';
import './my_game.dart';
import './floor.dart';

class Player extends SpriteComponent with CollisionCallbacks, 
  KeyboardHandler, HasGameRef<MyGame>{
  Player() : super(anchor: Anchor.center);
  final double gravity = 15;
  final double jumpSpeed = 600;
  final double terminalVelocity = 150;
  bool isOnGround = false;
  bool isOnLeft = false;
  bool isOnRight = false;

  @override void onLoad(){
    sprite = Sprite(game.images.fromCache('gallo_con_teni.png'));
    position = Vector2(1500, 600);
    size = Vector2(300, 300);
    priority = 1;
    add(RectangleHitbox(
        anchor: Anchor.bottomLeft,
        position: Vector2(150, 300),
        size: Vector2(150, 300),
      ));
  }

  @override void update(double dt){
    if(isOnGround == false) position.y += 3.8;
  }
  
  @override void onCollision(Set<Vector2> intersectionPoints, 
    PositionComponent other) {
    if(other is Floor) isOnGround = true;

    other is ScreenHitbox && position.x <= 0 
      ? isOnLeft = true
      : isOnLeft = false;

    other is ScreenHitbox && position.x > 0
      ? isOnRight = true
      : isOnRight = false;

    super.onCollision(intersectionPoints, other);
  }

  @override bool onKeyEvent(RawKeyEvent event,
    Set<LogicalKeyboardKey > keysPressed){
    if(isOnLeft == false){
      if(keysPressed.contains(LogicalKeyboardKey.keyA)
        || keysPressed.contains(LogicalKeyboardKey.arrowLeft)){
        position.x -= 30;
      }
    }

    if(isOnRight == false){
      if(keysPressed.contains(LogicalKeyboardKey.keyD)
        || keysPressed.contains(LogicalKeyboardKey.arrowRight)){
        position.x += 30;
      }
    }
    return true;
  }
}
//gravity aceleration formula 9.8 m/s2.
