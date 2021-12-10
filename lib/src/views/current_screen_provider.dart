import 'package:flutter/cupertino.dart';

enum ApplicationScreenState {
  home,
  stats,
  hots,
  store,
  settings,
}

class CurrentScreenProvider extends ChangeNotifier {
  CurrentScreenProvider() {
    init();
  }
  void init() {
    // Initialize the firestore database and all the stuff required.
  }
  ApplicationScreenState _screenState = ApplicationScreenState.home;
  ApplicationScreenState get screenState => _screenState;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void homePage() {
    _screenState = ApplicationScreenState.home;
    _currentIndex = 0;
    notifyListeners();
  }

  void statsPage() {
    _screenState = ApplicationScreenState.stats;
    _currentIndex = 1;
    notifyListeners();
  }

  void hotsPage() {
    _screenState = ApplicationScreenState.hots;
    _currentIndex = 2;
    notifyListeners();
  }

  void storePage() {
    _screenState = ApplicationScreenState.store;
    _currentIndex = 3;
    notifyListeners();
  }

  void settingsPage() {
    _screenState = ApplicationScreenState.settings;
    _currentIndex = 4;
    notifyListeners();
  }

  void setCurrentScreen(int index) {
    switch (index) {
      case 0:
        homePage();
        break;
      case 1:
        statsPage();
        break;
      case 2:
        hotsPage();
        break;
      case 3:
        storePage();
        break;
      case 4:
        settingsPage();
        break;
    }
  }
}
