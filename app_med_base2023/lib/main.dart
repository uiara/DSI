import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_med_base2023/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppWidget());
}
