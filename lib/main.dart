import 'package:bonfire/base/bonfire_game.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gametest/decoration/lamp.dart';
import 'package:gametest/enemies/orc.dart';
import 'package:gametest/hero.dart';
import 'package:get/get.dart';

const double tilesize = 16;
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
        lightingColorGame: Colors.black.withOpacity(0.8),
        cameraConfig: CameraConfig(
            moveOnlyMapArea: true,
            zoom: 2,
            smoothCameraEnabled: true,
            sizeMovementWindow: Vector2(tilesize * 2, tilesize * 2)),
        joystick: (GetPlatform.isDesktop)
            ? Joystick(
                keyboardConfig: KeyboardConfig(
                  keyboardDirectionalType: KeyboardDirectionalType.wasd,
                ),
              )
            : Joystick(directional: JoystickDirectional(), actions: [
                JoystickAction(actionId: 1, margin: EdgeInsets.all(70))
              ]),
        player: GameHero(Vector2(20 * tilesize, 11 * tilesize)),
        map: (TiledWorldMap('map/island.tmj',
            objectsBuilder: {
              'Orc': ((properties) => Orc(properties.position)),
              'Lamp': ((properties) => Lamp(properties.position)),
            },
            forceTileSize: Size(tilesize, tilesize))),
        showCollisionArea: false);
  }
}
