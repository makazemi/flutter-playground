import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/screen/list_questions_screen.dart';
import 'package:sample_flutter_web_app/screen/list_pull_question_screen.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:sample_flutter_web_app/cubit/status_cubit.dart';
import 'package:sample_flutter_web_app/cubit/status_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:flutter/foundation.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isEnabled=false;

  void navigateToListQuestion(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListQuestionScreen(phoneNumber: myController.text,)),
    );
  }

  void navigateToListPullQuestion(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListPullQuestionScreen(phoneNumber: myController.text,)),
    );
  }
  
  void openWebView() async{
    if (await canLaunch(LINK_URL)) {
      await launch(LINK_URL);
    } else {
      throw 'Could not launch';
    }
  }

  void handleStatus(String status){
    switch(status) {
      case "1": {
        navigateToListQuestion();
      }
      break;

      case "2": {
        navigateToListPullQuestion();
      }
      break;

      case "3": {
        openWebView();
      }
      break;

      default: {
        //statements;
      }
      break;
    }
  }

  void getStatus(){
    final statusCubit = context.read<StatusCubit>();
    statusCubit.getStatus(myController.text);
    print("get staus=${myController.text}");
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child:BlocConsumer<StatusCubit,StatusState>(
        listener: (context, state) {
          if (state is StatusError) {
            print("StatusError state");
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
          else if (state is StatusLoaded) {
            print("StatusLoaded state");
           handleStatus(state.status);
          }
        },
        builder: (context, state) {
          if (state is StatusInitial) {
            print("inital state");
            return buildInitialInput();
          } else if (state is StatusLoading) {
            print("StatusLoading state");
            return buildLoading();
          }  else {
            // (state is WeatherError)
            print("else state");
            return buildInitialInput();
          }
        },
      )
    ));
  }


  Widget buildInitialInput() {
    return InitialScreen();
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          child: Image(image: AssetImage('images/spring.png')),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              'متن دلخواه اینجا قرار می گیرد یمسیتبمسیبببببببببسمینبتتتتتتتتتتت',
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'شماره همراه',
            ),
            onChanged: (text){
              if(text.length==11){
                setState(() {
                  isEnabled=true;
                });
              }else{
                setState(() {
                  isEnabled=false;
                });
              }
            },
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed:() {
                  print("onpress");
                } ,
                child: Text('هدیه 1400'),
                style: ElevatedButton.styleFrom(
                    primary: pink, // background
                    textStyle: TextStyle(
                      fontFamily: 'IranSansFanum',)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: Image(image: AssetImage('images/spring.png')),
          ),
        ),
      ],
    );
  }
}

