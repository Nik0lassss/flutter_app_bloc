import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/presentation/di/component.dart';
import 'package:logs/logs.dart';
import 'app.dart';

final Log httpLog = Log('http');

void main() async {
  httpLog.enabled = true;
  await Component.init();
  runApp(App());
}
