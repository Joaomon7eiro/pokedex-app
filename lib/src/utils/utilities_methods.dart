import 'package:flutter/material.dart';

class Utilities {
  static Color getColor(String type) {
    switch (type) {
      case 'Grass':
        return Color(0xff49D0B0);
      case 'Water':
        return Color(0xff76BEFE);
      case 'Fire':
        return Color(0xffFC6C6D);
      case 'Bug':
        return Color(0xff809F5E);
      case 'Normal':
        return Color(0xffC3CED1);
      case 'Poison':
        return Color(0xffC097C9);
      case 'Electric':
        return Color(0xffFFD770);
      case 'Ground':
        return Color(0xffAB9D52);
      case 'Fighting':
        return Color(0xffD58A55);
      case 'Psychic':
        return Color(0xffF39DC9);
      case 'Rock':
        return Color(0xffA39045);
      case 'Ghost':
        return Color(0xff8677A3);
      case 'Ice':
        return Color(0xff7BCAE7);
      case 'Dragon':
        return Color(0xffF16E57);
      default:
        return Color(0xffAAAAAA);
    }
  }
}
