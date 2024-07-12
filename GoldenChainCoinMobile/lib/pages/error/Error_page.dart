import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  static const String routeName = '/error';

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  // final _errorBloc = ErrorBloc(UnErrorState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        child: Center(child: Text("ERREUR DE PAGE"),),
      ),
    );
  }
}
