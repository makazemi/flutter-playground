import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/screen/list_pull_question_screen.dart';
import 'screen/list_questions_screen.dart';
import 'screen/award_screen.dart';
import 'screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/list-question': (BuildContext context) => ListQuestionScreen(),
        '/list-pull-question': (BuildContext context) => ListPullQuestionScreen(),
        '/award-screen': (BuildContext context) => AwardScreen(),
      },
      theme: ThemeData(
        fontFamily: 'IranSans',
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.grey.shade800),
        ),
      ),
    );
  }
}
