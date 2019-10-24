import 'package:flame/box2d/box2d_component.dart';
import 'package:flutter_game/floor.dart';
import 'package:flutter_game/hero.dart';

class Stage extends Box2DComponent {
  Floor _floor;
  Hero _hero;

  Stage() : super() {
    _floor = Floor(this);
    _hero = Hero(this);
  }

  @override
  void initializeWorld() {
    add(_floor);
    add(_hero);
  }

  void onTap() {
    _hero.jump();
  }
}
