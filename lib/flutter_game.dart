import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_game/stage.dart';

class FlutterGame extends Game {
  Stage _stage;
  TapGestureRecognizer _tapRecognizer;

  FlutterGame() {
    _tapRecognizer = TapGestureRecognizer()..onTap = _onTap;

    Flame.util.addGestureRecognizer(_tapRecognizer);

    _stage = Stage();
    _stage.initializeWorld();
  }

  void _onTap() {
    _stage.onTap();
  }

  @override
  void render(Canvas canvas) {
    _stage.render(canvas);
  }

  @override
  void update(double t) {
    _stage.update(t);
  }

  @override
  void resize(Size size) {
    _stage.resize(size);
  }
}
