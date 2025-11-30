import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getRouteWidget() {
  return MaterialApp(
    initialRoute: '/',
    routes: getRootRoutes(),
  );
}


Map<String, Widget Function(BuildContext)> getRootRoutes() { 
  return {
    '/': (context) => MainPage(),
    '/detail': (context) => LoginPage(),
  };
}