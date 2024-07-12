import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldenchaincoin/pages/home/home_page.dart';
import 'package:goldenchaincoin/routes/AppRoute.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  
  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

final AppRouter _appRouter = AppRouter();

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
        scaffoldBackgroundColor: Color.fromARGB(247, 238, 238, 238),
        fontFamily: GoogleFonts.lato().fontFamily,
        // primaryColorLight: Colors.white,
        useMaterial3: true,
      ),
      // home:  HomePage(),
      onGenerateRoute: _appRouter.generateRoute,
    );
  }
}

