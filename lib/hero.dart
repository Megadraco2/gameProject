import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:gametest/game_sprite_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision {
  GameHero(Vector2 position)
      : super(
            size: Vector2(32, 32),
            position: position,
            animation: SimpleDirectionAnimation(
                //Parado
                idleUp: GameSpriteSheet.heroIdleUp,
                idleDown: GameSpriteSheet.heroIdleDown,
                idleRight: GameSpriteSheet.heroIdleRight,
                idleLeft: GameSpriteSheet.heroIdleLeft,
                //Correndo
                runRight: GameSpriteSheet.heroRunRight,
                runLeft: GameSpriteSheet.heroRunLeft,
                runDown: GameSpriteSheet.heroRunDown,
                runUp: GameSpriteSheet.heroRunUp),
            speed: 60) {
    setupCollision(CollisionConfig(
        collisions: [CollisionArea.rectangle(size: Vector2(32, 32))]));
  }
}
