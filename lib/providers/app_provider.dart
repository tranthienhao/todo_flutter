import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const APP_STATE = 'APP_STATE';

class AppProvider {
  loadAppState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var localAppState = prefs.getString(APP_STATE);
    if (localAppState != null) {
      var appState = JsonDecoder().convert(localAppState);
      return appState;
    }
    return {};
  }

  void saveAppState({darkMode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String appStateJson = JsonEncoder().convert({'darkMode': darkMode});
    prefs.setString(APP_STATE, appStateJson);
  }
}
