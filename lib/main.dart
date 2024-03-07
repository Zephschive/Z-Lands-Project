import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:zlandsfrontend/firebase_options.dart';
import 'package:zlandsfrontend/google_map.dart';

import 'package:zlandsfrontend/pages/splashcreen.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zlands ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        
        useMaterial3: true,
      ),
      home:SplashView(),
    );
  }
}


