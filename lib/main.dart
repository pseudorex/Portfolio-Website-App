import 'package:flutter/material.dart';
import 'package:my_portfolio/firebase_options.dart';
import 'package:my_portfolio/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      home: const HomePage()
    );
  }
}

