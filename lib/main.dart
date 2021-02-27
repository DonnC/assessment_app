import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:assessment_app/screens/index.dart';
import 'package:assessment_app/utils/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      debugShowCheckedModeBanner: false,
      theme: colorTheme,
      home: PhoneInputPage(),
    );
  }
}