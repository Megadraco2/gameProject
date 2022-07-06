import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gametest/game_sprite_sheet.dart';
import 'package:gametest/main.dart';
import 'package:get/get.dart';

class GameHero extends SimplePlayer with ObjectCollision, Lighting {
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

    setupLighting(LightingConfig(
        radius: tilesize * 1.5, color: Colors.transparent, withPulse: true));
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN &&
        (event.id == 1 || event.id == LogicalKeyboardKey.space.keyId)) {
      _executeAttack();
    }
    super.joystickAction(event);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2(16, 16),
      sizePush: tilesize * 0.5,
      animationDown: PlayerSpriteSheet.attackBottom,
      animationUp: PlayerSpriteSheet.attackTop,
      animationLeft: PlayerSpriteSheet.attackLeft,
      animationRight: PlayerSpriteSheet.attackRight,
    );
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
