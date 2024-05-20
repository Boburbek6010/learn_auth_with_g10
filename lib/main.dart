import 'package:flutter/material.dart';
import 'package:learn_auth_with_g10/setup.dart';
import 'app.dart';

Future<void> main() async{
  await setup();
  runApp(const App());
}
