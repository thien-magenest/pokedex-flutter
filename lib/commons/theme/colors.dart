import 'dart:ui';

class PokemonColors {
  static const red = Color(0xFFDA3914);
  static const blue = Color(0xFF05A8D9);
  static const yellow = Color(0xFFFFD733);
  static const green = Color(0xFF24A724);
  static const black = Color(0xFF444444);
  static const brown = Color(0xFFBF8040);
  static const purple = Color(0xFF9141CB);
  static const gray = Color(0xFFA0A08D);
  static const white = Color(0xFFE1E1E1);
  static const pink = Color(0xFFD2458D);

  static final _colorMap = <String, Color>{
    'red': red,
    'blue': blue,
    'yellow': yellow,
    'green': green,
    'black': black,
    'brown': brown,
    'purple': purple,
    'gray': gray,
    'white': white,
    'pink': pink,
  };

  static Color fromName(String name) {
    return _colorMap[name] ?? white;
  }
}
