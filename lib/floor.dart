import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/box2d/box2d_component.dart';
import 'package:flame/flare_animation.dart';
import 'package:flutter/painting.dart';

class Floor extends BodyComponent {
  final _height = 4.0;

  PolygonShape _shape;
  BodyDef _bodyDef;
  FixtureDef _fixtureDef;
  FlareAnimation _animation;

  Floor(Box2DComponent box) : super(box) {
    _shape = PolygonShape();
    _shape.setAsBoxXY(viewport.width, _height);

    _bodyDef = BodyDef();
    _bodyDef.position = Vector2(0, -(viewport.height / 2) + _height);

    _fixtureDef = FixtureDef();
    _fixtureDef.shape = _shape;

    body = world.createBody(_bodyDef)..createFixtureFromFixtureDef(_fixtureDef);

    FlareAnimation.load('assets/images/Floor.flr').then((animation) {
      _animation = animation;
      _animation.width = 1080;
      _animation.height = 128;
      print(viewport.height);
      _animation.updateAnimation('Default');
    });
  }

  @override
  void renderPolygon(Canvas canvas, List<Offset> points) {
    if (_animation != null) {
      _animation.y = points[3].dy - _animation.height + (_height * 2);
      _animation.render(canvas);
    }
  }

  @override
  void update(double t) {
    if (_animation != null) {
      _animation.update(t);
    }
  }
}
