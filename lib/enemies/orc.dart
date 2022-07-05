import 'package:bonfire/bonfire.dart';
import 'package:gametest/enemies/orc_sprite_sheet.dart';
import 'package:gametest/main.dart';

class Orc extends SimpleEnemy {
  bool canMove = true;

  Orc(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(tilesize),
          speed: 20,
          animation: SimpleDirectionAnimation(
            idleRight: OrcSpriteSheet.idleRight,
            runRight: OrcSpriteSheet.idleLeft,
          ),
        );
}
