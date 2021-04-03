import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/screen/list_questions_screen.dart';
import 'package:sample_flutter_web_app/screen/list_pull_question_screen.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:sample_flutter_web_app/model/response.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _inProgress = false;

  void navigateToListQuestion() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListQuestionScreen(
                phoneNumber: myController.text,
              )),
    );
  }

  void navigateToListPullQuestion() {
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

  void handleStatus(int status) {
    switch (status) {
      case 1:
        {
          navigateToListQuestion();
        }
        break;

      case 2:
        {
          navigateToListPullQuestion();
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

  void getStatus() {
    setProgress(true);
    fetchStatus(myController.text);
    log("get staus=${myController.text}");
  }

  void fetchStatus(String phone) async {
    try {
      var response = await http.get(
        Uri.parse(
            '${BASE_URL}status?mobile=$phone&sec_code=$QUERY_PARAMETER_FIX'),
        headers: {'Accept': 'application/json'},
      );
      log("response=${response.body.toString()}");
      if (response.statusCode == 200) {
        setProgress(false);
        final status = QuestionResponseData.fromJson(jsonDecode(response.body))
            .data
            .status;
        //  var decode=jsonDecode(response.body);
        handleStatus(status);
        log('ok respons=$status');
      } else {
        handleError();
        log('error=${response.toString()}');
      }
    } catch (e) {
      log('exceppoin=${e.toString()}');
      handleError();
    }
  }

  void handleError() {
    setProgress(false);
    var message = 'خطا در ارتباط با سرور';
    if (myController.text.isEmpty)
      message =
          'لطفا شماره همراهی که در سایت یا اپلیکیشن ثبت نام کرده اید را وارد کنید.';
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
    log('error');
  }

  void setProgress(bool isProgress) {
    setState(() {
      _inProgress = isProgress;
    });
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: _inProgress
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
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
                            getStatus();
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
              )),
      ),
    );
  }
}
