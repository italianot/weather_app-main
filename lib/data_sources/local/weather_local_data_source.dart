import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/global.dart';

class WeatherLocalDataSource {
  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Global? get() {
    final json = prefs.getString('weather');
    if (json != null) {
      return Global.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }

  Future<void> set(Global global) => prefs.setString(
        'weather',
        jsonEncode(
          global.toJson(),
        ),
      );
}
