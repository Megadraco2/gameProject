import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:gametest/game_sprite_sheet.dart';
import 'package:gametest/main.dart';

class GameHero extends SimplePlayer with ObjectCollision {
  GameHero(Vector2 position)
      : super(
          size: Vector2(tilesize, tilesize),
          position: position,
          animation: SimpleDirectionAnimation(
              //Parado
              idleUp: PlayerSpriteSheet.heroIdleUp,
              idleDown: PlayerSpriteSheet.heroIdleDown,
              idleRight: PlayerSpriteSheet.heroIdleRight,
              idleLeft: PlayerSpriteSheet.heroIdleLeft,
              //Correndo
              runRight: PlayerSpriteSheet.heroRunRight,
              runLeft: PlayerSpriteSheet.heroRunLeft,
              runDown: PlayerSpriteSheet.heroRunDown,
              runUp: PlayerSpriteSheet.heroRunUp),
          speed: 40,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(tilesize, 6), align: Vector2(0, 10))
    ]));
  }
}
