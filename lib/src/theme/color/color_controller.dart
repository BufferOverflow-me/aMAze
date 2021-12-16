import 'package:fitness_app/src/theme/color/colorService.dart';
import 'package:flutter/cupertino.dart';

class ColorController extends ChangeNotifier {
  // ignore: empty_constructor_bodies
  // ColorController(this._colorService);
  late final ColorService _colorService;

  late int _color;
  int get color => _color;

  Future<void> loadColor() async {
    _color = await _colorService.colorMode() ?? 0;
    debugPrint('#####################color: $_color');
    notifyListeners();
  }

  Future<void> updateColorMode(int newColor) async {
    // Do not update if the color is the same
    if (newColor == color) return;

    // else
    _color = newColor;
    notifyListeners();

    // persist the color
    await _colorService.setColorMode(newColor);
  }
}
