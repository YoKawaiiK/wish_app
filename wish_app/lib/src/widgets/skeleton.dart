import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

const Color _defaultColor = Colors.black;

enum _ConstructorType {
  basic,
  round,
  elevatedButton,
  hardCorners,
}

class Skeleton extends StatelessWidget {
  late final double? height;
  late final double? width;
  late final Color? color;
  late final double? radius;

  late final _ConstructorType _constructorType;

  static const Color _defaultColor = Colors.black;
  // static const Color _defaultColor = Colors.black.withOpacity(0.05);
  static const double _defaultRadius = 15;
  // const Skeleton({
  //   Key? key,
  //   required this.height,
  //   required this.widFth,
  //   this.color,
  //   this.radius,
  // }) : super(key: key);
  Skeleton({
    Key? key,
    this.height,
    this.width,
    color,
    this.radius = _defaultRadius,
  }) : super(key: key) {
    key = key;
    this.color = ((color ?? _defaultColor) as Color).withOpacity(0.05);
    _constructorType = _ConstructorType.basic;
  }

  Skeleton.round({
    Key? key,
    color,
    required this.radius,
  }) : super(key: key) {
    // this.height = height;
    this.color = ((color ?? _defaultColor) as Color).withOpacity(0.05);
    _constructorType = _ConstructorType.round;
  }

  Skeleton.hardCorners({
    Key? key,
    color,
    this.height = double.infinity,
    this.width = double.infinity,
  }) : super(key: key) {
    _constructorType = _ConstructorType.hardCorners;
    radius = _defaultRadius;
    this.color = ((color ?? _defaultColor) as Color).withOpacity(0.05);
  }

  Skeleton.elevatedButton({
    Key? key,
    color,
    this.width = 100,
    this.height,
  }) : super(key: key) {
    _constructorType = _ConstructorType.elevatedButton;
    this.color = ((color ?? _defaultColor) as Color).withOpacity(0.05);
    this.radius = _defaultRadius;
  }

  @override
  Widget build(BuildContext context) {
    switch (_constructorType) {
      case _ConstructorType.round:
        return CircleAvatar(
          radius: radius,
          backgroundColor: color,
        );
      case _ConstructorType.elevatedButton:
        return SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: null,
            child: null,
            style: ElevatedButton.styleFrom(
              primary: color,
            ),
          ),
        );
      case _ConstructorType.hardCorners:
      default:
        return Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color ?? _defaultColor,
            borderRadius: BorderRadius.all(
              Radius.circular(radius!),
            ),
          ),
        );
    }
  }
}
