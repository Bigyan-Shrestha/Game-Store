import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'App Screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isWindows) {
    await DesktopWindow.setMinWindowSize(const Size(550, 650));
  }
  ;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.red[300]),
    home: LoginPage(),
  )); //My App
}
