import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter_web_app/repository/main_repository.dart';
import 'package:sample_flutter_web_app/repository/main_repository_implementation.dart';
import 'package:sample_flutter_web_app/screen/list_pull_question_screen.dart';
import 'package:sample_flutter_web_app/services/api.dart';
import 'package:sample_flutter_web_app/util/simple_bloc_observer.dart';
import 'bloc/home/home_bloc.dart';
import 'screen/list_questions_screen.dart';
import 'screen/award_screen.dart';
import 'screen/home_screen.dart';

void main() {

  Bloc.observer = SimpleBlocObserver();

  final mainRepository = MainRepositoryImpl(
   apiService: Api()
  );

  runApp(MyApp(mainRepository: mainRepository,));
}

class MyApp extends StatelessWidget {

  final MainRepository mainRepository;

  MyApp({required this.mainRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) {
          return BlocProvider( create: (_) => HomeBloc(mainRepository: mainRepository),
          child:HomeScreen(mainRepository: mainRepository));
        } ,
        '/list-question': (BuildContext context) => ListQuestionScreen(phoneNumber: '',),
        '/list-pull-question': (BuildContext context) => ListPullQuestionScreen(phoneNumber: '',),
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
