import 'package:shared_preferences/shared_preferences.dart';

class ColorService {
  Future<int?> colorMode() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt('colorMode');
  }

  Future<void> setColorMode(int colorVal) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt('colorMode', colorVal);
  }
}
