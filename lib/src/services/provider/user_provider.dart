// This will provide the details such as user's Image url, name, etc

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  late String _userName;
  late String _userEmail;
  late String _userImageUrl;
  late String _userId;

  UserProvider() {
    init();
  }

  Future<void> init() async {
    debugPrint('#### Init being Executed!! ####');
    _userName = FirebaseAuth.instance.currentUser?.displayName ?? '';
    _userEmail = FirebaseAuth.instance.currentUser?.email ?? '';
    _userImageUrl = FirebaseAuth.instance.currentUser?.photoURL ??
        'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y';
    _userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    notifyListeners();
  }

  String get userName => _userName;
  String get userEmail => _userEmail;
  String get userImageUrl => _userImageUrl;
  String get userId => _userId;
}
