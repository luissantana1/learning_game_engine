import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import './my_game.dart';

class Floor extends SpriteComponent with HasGameRef<MyGame>{
  Floor() : super(anchor: Anchor.bottomLeft);

  @override void onLoad(){
    sprite = Sprite(game.images.fromCache('floor_image.png'));
    position = Vector2(0, 1028);
    size = Vector2(1920,200);
    priority = 0;
    add(RectangleHitbox(
        anchor: Anchor.bottomLeft,
        position: Vector2(0, 250),
        size: Vector2(1920, 150),
      )
    );
  }
}
