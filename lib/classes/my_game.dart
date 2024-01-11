import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import './player.dart';
import './floor.dart';

class MyGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  final world = World();
  late final CameraComponent cameraComponent;
  late Player player;
  late Floor floor;

  @override bool debugMode = true; // show hitbox area
  
  @override Color backgroundColor() {
    //return const Color.fromARGB(255, 172, 223, 247); // lightblue
    return const Color.fromARGB(0, 0, 0, 0); //dark
  }

  @override Future <void> onLoad() async {
    await images.loadAll([
      'gallo_con_teni.png',
      'floor_image.png',
    ]);
    cameraComponent = CameraComponent(world: world);
    cameraComponent.viewfinder.anchor = Anchor.topLeft;
    add(ScreenHitbox());
    player = Player();
    floor = Floor();
    addAll([cameraComponent, world, player, floor]);
  }
}
