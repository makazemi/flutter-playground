import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/screen/list_questions_screen.dart';
import 'package:sample_flutter_web_app/screen/list_pull_question_screen.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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

  void getStatus(BuildContext context) {
    setProgress(true);
    fetchStatus(myController.text,context);
    log("get staus=${myController.text}");
  }

  void fetchStatus(String phone,BuildContext context) async {
    var queryParameters = {
      'sec_code': QUERY_PARAMETER_FIX,
      'mobile': phone,
    };
    // '${BASE_URL}status',queryParameters
   // var uri = Uri.https(BASE_URL, 'status?mobile=$phone&sec_code=QUERY_PARAMETER_FIX', queryParameters);

    log('fetchquestion=$phone');

    try{
      http.Response response = await http.get(Uri.parse('${BASE_URL}status?mobile=$phone&sec_code=$QUERY_PARAMETER_FIX'),headers: {'Accept':'application/json'});
      if (response.statusCode == 200) {
        setProgress(false);
        final status = QuestionResponseData.fromJson(jsonDecode(response.body)).data.status;
        //  var decode=jsonDecode(response.body);
        handleStatus(status);
        log('ok respons=$status');

      } else {
        handleError(context);
      }
    } catch(Exception){
      handleError(context);
    }
  }

  void handleError(BuildContext context){
    setProgress(false);
    var message='خطا در ارتباط با سرور';
    if(myController.text.isEmpty)
      message='لطفا شماره همراهی که در سایت یا اپلیکیشن ثبت نام کرده اید را وارد کنید.';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    log('error');
  }

  void setProgress(bool isProgress){
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
        body: ModalProgressHUD(
      inAsyncCall: _inProgress,
      child: SafeArea(
          child: Column(
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
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    log("onPress");
                   // getStatus(context);
                    navigateToListQuestion();
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
            child: Container(
              child: Image(image: AssetImage('images/spring.png')),
            ),
          ),
        ],
      )),
    ));
  }


}
