import 'package:box2d_flame/box2d.dart';
import 'package:flame/box2d/box2d_component.dart';

class Hero extends BodyComponent {
  final _radius = 8.0;
  final _jumpForce = 8.0;

  Shape _shape;
  BodyDef _bodyDef;
  FixtureDef _fixtureDef;

  Hero(Box2DComponent box) : super(box) {
    _shape = CircleShape();
    _shape.radius = _radius;

    _bodyDef = BodyDef();
    _bodyDef.type = BodyType.DYNAMIC;

    _fixtureDef = FixtureDef();
    _fixtureDef.shape = _shape;

    body = world.createBody(_bodyDef)..createFixtureFromFixtureDef(_fixtureDef);
  }

  void jump() {
    body.applyLinearImpulse(
        Vector2(0, body.mass * _jumpForce), body.worldCenter, true);
  }
}
