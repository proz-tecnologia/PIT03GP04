import 'package:flutter/material.dart';

class PieDat2a {
  static List<Data> data = [
    Data(name: "Blue", percent: 40, color: const Color(0xff0293ee)),
    Data(name: "Orange", percent: 30, color: const Color(0xfff8b250)),
    Data(name: "Black", percent: 15, color: const Color(0x00000000)),
    Data(name: "Green", percent: 15, color: const Color(0xff13d38e)),
  ];
}

class Data {
  final String? name;
  final double? percent;
  final Color? color;

  Data({this.name, this.percent, this.color});
}
