import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  /// Load the user preferred thememode
  Future<ThemeMode> themeMode() async {
    final pref = await SharedPreferences.getInstance();

    /// If any value exist in memory then return it, else use the system default theme.
    return ThemeMode.values[pref.getInt('theme') ?? ThemeMode.system.index];
    // if(pref.getInt('theme') !=null){
    //   return ThemeMode.values[pref.getInt('theme')];
    // }
  }

  /// Persist the user preferred theme in the shared preferences.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Persisting the value on disk.
    final pref = await SharedPreferences.getInstance();
    await pref.setInt('theme', theme.index);
  }
}
