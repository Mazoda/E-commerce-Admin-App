
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navkey = GlobalKey();
  static PushToWidget(Widget widget) async {
    String? x = await Navigator.of(navkey.currentContext!)
        .push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
  static PushWithReplacementToWidget(Widget widget){
    Navigator.of(navkey.currentContext!).pushReplacement(MaterialPageRoute(builder: (context){
      return widget;
    }));
  }
}
