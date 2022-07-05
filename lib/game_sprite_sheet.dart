import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get heroIdleUp => SpriteAnimation.load(
      'link_minish.png',
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.15,
          textureSize: Vector2(120, 130),
          texturePosition: Vector2(0, 264)));

  static Future<SpriteAnimation> get heroIdleDown => SpriteAnimation.load(
      'link_minish.png',
      SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(120, 130),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
          'link_minish.png',
          SpriteAnimationData.sequenced(
              amount: 3,
              stepTime: 0.15,
              textureSize: Vector2(120, 130),
              texturePosition: Vector2(0, 132)))
      .timeout(Duration(seconds: 10));

  static Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
      'link_minish.png',
      SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(120, 130),
          texturePosition: Vector2(0, 390)));

  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
      'link_minish.png',
      SpriteAnimationData.sequenced(
          amount: 10,
          stepTime: 0.15,
          textureSize: Vector2(120, 130),
          texturePosition: Vector2(0, 650)));

  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
      'link_minish.png',
      SpriteAnimationData.sequenced(
          amount: 10,
          stepTime: 0.15,
          textureSize: Vector2(120, 130),
          texturePosition: Vector2(0, 910)));

  static Future<SpriteAnimation> get heroRunUp => SpriteAnimation.load(
      'link_minish.png',
      SpriteAnimationData.sequenced(
          amount: 10,
          stepTime: 0.15,
          textureSize: Vector2(120, 130),
          texturePosition: Vector2(0, 780)));
  static Future<SpriteAnimation> get heroRunDown => SpriteAnimation.load(
      'link_minish.png',
      SpriteAnimationData.sequenced(
          amount: 10,
          stepTime: 0.15,
          textureSize: Vector2(120, 130),
          texturePosition: Vector2(0, 520)));

  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
      'atack_effect_left.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
      ));
  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
      'atack_effect_right.png',
      SpriteAnimationData.sequenced(
          amount: 3, stepTime: 0.15, textureSize: Vector2(16, 16)));
  static Future<SpriteAnimation> get attackBottom => SpriteAnimation.load(
      'atack_effect_bottom.png',
      SpriteAnimationData.sequenced(
          amount: 3, stepTime: 0.15, textureSize: Vector2(16, 16)));
  static Future<SpriteAnimation> get attackTop => SpriteAnimation.load(
      'atack_effect_top.png',
      SpriteAnimationData.sequenced(
          amount: 3, stepTime: 0.15, textureSize: Vector2(16, 16)));
}
