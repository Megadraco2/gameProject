import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gametest/main.dart';

class Lamp extends GameDecoration with Lighting {
  Lamp(Vector2 position)
      : super(position: position, size: Vector2(tilesize, tilesize)) {
    setupLighting(LightingConfig(
        radius: tilesize,
        color: Colors.orange.withOpacity(0.3),
        withPulse: true,
        pulseVariation: 0.2));
  }
}
