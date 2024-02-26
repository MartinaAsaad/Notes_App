import 'package:flutter/material.dart';

Color bluecolor = Color.fromARGB(255, 2, 33, 59);
LinearGradient bluegradient =
    LinearGradient(colors: [bluecolor, Color.fromARGB(255, 9, 77, 133)]);
LinearGradient redgradient = LinearGradient(colors: [
  Color.fromARGB(255, 126, 12, 4),
  const Color.fromARGB(255, 209, 54, 43)
]);
LinearGradient purplegradient = LinearGradient(
    colors: [const Color.fromARGB(255, 79, 7, 92), Colors.purple]);

Map<String, LinearGradient> mapofcolors = {
  '$bluegradient': bluegradient,
  '$redgradient': redgradient,
  '$purplegradient': purplegradient
};
