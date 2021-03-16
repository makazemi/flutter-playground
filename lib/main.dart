import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/data/repository.dart';
import 'screen/list_questions_screen.dart';
import 'screen/award_screen.dart';
import 'screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/status_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'IranSans',
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.grey.shade800),
        ),
      ),
      home: BlocProvider(
        create: (context) => StatusCubit(QuestionRepositoryImpl()),
        child: Directionality(
            textDirection:  TextDirection.rtl,
            child: HomeScreen(),
        ),
      ),
    );
  }
}



