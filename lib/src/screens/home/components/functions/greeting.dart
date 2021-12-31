import 'package:flutter/cupertino.dart';

String greeting() {
  debugPrint('greeting is executed!');
  if (DateTime.now().hour < 12) {
    return 'Good Morning,';
  } else if (DateTime.now().hour < 16) {
    return 'Good Afternoon,';
  } else if (DateTime.now().hour < 22) {
    return 'Good Evening,';
  } else {
    return 'Good Night,';
  }
}
