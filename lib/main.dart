import 'package:bonfire/base/bonfire_game.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gametest/hero.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First_Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
        joystick: Joystick(
            keyboardConfig: KeyboardConfig(
                keyboardDirectionalType: KeyboardDirectionalType.wasd)),
        player: GameHero(Vector2(20 * 32, 11 * 32)),
        map: (TiledWorldMap('map/island.tmj', forceTileSize: Size(32, 32))));
  }
}
