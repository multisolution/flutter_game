import 'package:box2d_flame/box2d.dart';
import 'package:flame/box2d/box2d_component.dart';

class Floor extends BodyComponent {
  final _height = 4.0;

  PolygonShape _shape;
  BodyDef _bodyDef;
  FixtureDef _fixtureDef;

  Floor(Box2DComponent box) : super(box) {
    _shape = PolygonShape();
    _shape.setAsBoxXY(viewport.width, _height);

    _bodyDef = BodyDef();
    _bodyDef.position = Vector2(0, -(viewport.height / 2) + _height);

    _fixtureDef = FixtureDef();
    _fixtureDef.shape = _shape;

    body = world.createBody(_bodyDef)..createFixtureFromFixtureDef(_fixtureDef);
  }
}
