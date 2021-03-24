import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  //Guardo el ancho, alto y diagonal del dispositivo.
  double _width, _height, _diagonal;
  bool _isTablet;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  bool get isTablet => _isTablet;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    this._width = size.width;
    this._height = size.height;
    //Uso pitagoras para calcular la diagonal
    //c2 = a2 + b2
    this._diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    this._isTablet = size.shortestSide >= 600;
  }

  //Obtener el x% de la altura, diagonal, etc.
  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
}
