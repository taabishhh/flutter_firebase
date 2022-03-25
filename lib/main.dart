import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/approuter.dart';
import 'views/login.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MainPage(
    router: AppRouter(),
  ));
}

String initialRoute = '/login';

class MainPage extends StatelessWidget {
  final AppRouter router;
  const MainPage({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
