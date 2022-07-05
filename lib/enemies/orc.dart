import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:gametest/enemies/orc_sprite_sheet.dart';
import 'package:gametest/game_sprite_sheet.dart';
import 'package:gametest/hero.dart';
import 'package:gametest/main.dart';

class Orc extends SimpleEnemy with ObjectCollision {
  bool canMove = true;

  Orc(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(tilesize),
          speed: 20,
          animation: SimpleDirectionAnimation(
              idleRight: OrcSpriteSheet.idleRight,
              idleLeft: OrcSpriteSheet.idleLeft,
              runRight: OrcSpriteSheet.runRight,
              runLeft: OrcSpriteSheet.runLeft),
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(8, 5), align: Vector2(4, 11))
    ]));
  }

  @override
  void update(double dt) {
    if (canMove) {
      seeAndMoveToPlayer(
          closePlayer: (player) {
            _executeAttack();
          },
          radiusVision: tilesize * 2,
          margin: 4);
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(canvas,
        borderWidth: 2,
        borderRadius: BorderRadius.circular(5),
        height: 2,
        align: Offset(0, -5));
    super.render(canvas);
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(OrcSpriteSheet.dieLeft, runToTheEnd: true);
    } else {
      animation?.playOnce(OrcSpriteSheet.dieRight, runToTheEnd: true);
    }
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(OrcSpriteSheet.receiveDamageLeft, runToTheEnd: true,
          onFinish: () {
        canMove = true;
      });
    } else {
      animation?.playOnce(OrcSpriteSheet.receiveDamageRight, runToTheEnd: true,
          onFinish: () {
        canMove = true;
      });
    }
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void _executeAttack() {
    simpleAttackMelee(
        damage: 20,
        size: Vector2(16, 16),
        sizePush: tilesize * 0.5,
        animationDown: PlayerSpriteSheet.attackBottom,
        animationUp: PlayerSpriteSheet.attackTop,
        animationLeft: PlayerSpriteSheet.attackLeft,
        animationRight: PlayerSpriteSheet.attackRight);
  }
}
