import 'package:flutter/cupertino.dart';

enum ApplicationScreenState {
  home,
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

  void hotsPage() {
    _screenState = ApplicationScreenState.hots;
    _currentIndex = 1;
    notifyListeners();
  }

  void storePage() {
    _screenState = ApplicationScreenState.store;
    _currentIndex = 2;
    notifyListeners();
  }

  void setCurrentScreen(int index) {
    switch (index) {
      case 0:
        return homePage();
      case 1:
        return hotsPage();
      case 2:
        return storePage();
      default:
        return homePage();
    }
  }
}
