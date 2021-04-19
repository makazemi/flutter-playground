import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter_web_app/bloc/home_bloc.dart';
import 'package:sample_flutter_web_app/bloc/home_event.dart';
import 'package:sample_flutter_web_app/bloc/home_state.dart';
import 'package:sample_flutter_web_app/repository/main_repository.dart';
import 'package:sample_flutter_web_app/screen/list_questions_screen.dart';
import 'package:sample_flutter_web_app/screen/list_pull_question_screen.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';


class HomeScreen extends StatefulWidget {

  final MainRepository mainRepository;



  HomeScreen({required this.mainRepository});

  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  void navigateToListQuestion(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListQuestionScreen(
            phoneNumber: myController.text,
          )),
    );
  }

  void navigateToListPullQuestion(BuildContext context) {
    log('navigateToListPullQuestion');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListPullQuestionScreen(
            phoneNumber: myController.text,
          )),
    );
  }

  void openWebView() async {
    if (await canLaunch(LINK_URL)) {
      await launch(LINK_URL);
    } else {
      throw 'Could not launch';
    }
  }

  void handleStatus(int status,BuildContext context) {
    switch (status) {
      case 1:
        {
          navigateToListQuestion(context);
        }
        break;

      case 2:
        {
          navigateToListPullQuestion(context);
        }
        break;

      case 3:
        {
          openWebView();
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void handleError(BuildContext context,String? msg) {
    var message='';
    if(msg==null)
      message='خطا در ارتباط با سرور';
    else
      message=msg;
    if (myController.text.isEmpty)
      message =
      'لطفا شماره همراهی که در سایت یا اپلیکیشن ثبت نام کرده اید را وارد کنید.';
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
    log('error');
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
              child: BlocConsumer<HomeBloc,HomeState>(
                listener : (context, state){
                  if(state is HomeError){
                    handleError(context,state.message);
                  }
                  if(state is HomeLoaded){
                    handleStatus(state.status, context);
                  }
                },
                  builder: (context, state) {
                  if(state is HomeLoading)
                    return Center(child: CircularProgressIndicator(),);
                    return homeWidget(context);
                  }
              ),
          ),
        ),
      );
  }

  Widget homeWidget(BuildContext context){
    final homeBloc= BlocProvider.of<HomeBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //        Container(
        //           height: 200,
        Expanded(
          child: Image(
              image: AssetImage('images/bannerhometop.jpg'),
              fit: BoxFit.fill),
          flex: 2,
        ),
        // fit: BoxFit.fitWidth,),
        //),

        Container(
          margin: EdgeInsets.all(16),
          child: Text(
            'سلام چندماهمه ای عزیز\n'
                'سال نوت مبارک! امیدواریم که این ۱۳ روز فروردین حسابی بهت خوش گذشته باشه.'
                'برای این که امروز هم ۱۳بدر کنی و هم عیدی سال ۱۴۰۰ رو از ما بگیری، یه سوپرایز ویژه و خفن برات داریم، فقط کافیه به سوال های بعدی جواب بدی و منتظر هدیه خفن ما باشی.\n'
                'شماره همراهت رو وارد کن و بعد روی دکمه «عیدی ۱۴۰۰» بزن تا بریم.',
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'شماره همراه',
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  log("onPress");
                  homeBloc.add(FetchStatus(phone: myController.text.toString()));

                },
                child: Text('هدیه 1400'),
                style: ElevatedButton.styleFrom(
                    primary: pink, // background
                    textStyle: TextStyle(
                      fontFamily: 'IranSansFanum',
                    )),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage('images/bannerhomebottom.jpg'),
          ),
        ),
      ],
    );
  }
}

