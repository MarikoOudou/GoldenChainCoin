import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldenchaincoin/home/home_page.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  
  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Code',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.black12,
        // primaryColorLight: Colors.white,
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}

