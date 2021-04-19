import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:sample_flutter_web_app/widget/options_list.dart';


class ListQuestionScreen extends StatefulWidget {
  final String phoneNumber;

  ListQuestionScreen({required this.phoneNumber});

  @override
  _ListQuestionScreenState createState() => _ListQuestionScreenState();
}

class _ListQuestionScreenState extends State<ListQuestionScreen> {


  @override
  void initState() {
    super.initState();
  }

  void goToAwardScreen() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/award-screen', ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child:
           // model.state == ViewState.Busy
               // ? Center(child: CircularProgressIndicator())
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(image: AssetImage('images/bannerquestion.jpg')),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                          color: grey1),
                      child: Column(children: [
                       // model.questionState.data != null ?
                        Column(
                          children: [
                            Text('model.currentQuestion.label'),
                            SizedBox(
                              height: 10,
                            ),
                            OptionList(),
                          ],
                        ),
                            //: Text(model.questionState.error),
                        SizedBox(
                          height: 10,
                        ),
                       // if (model.currentQuestion.optionState == OptionState.wrong)
                          buildBoxWrongAnswer(),
                        //else if (model.currentQuestion.optionState ==OptionState.correct)
                       //   buildBoxCorrectAnswer(),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildButtonChangeQuestion(),
                  ]),
            ),
          ),
        ),
      );

  }

  Widget buildButtonChangeQuestion() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  // if (model.changeActionNextQuestion) {
                  //   goToAwardScreen();
                  // } else {
                  //   model.nextQuestion();
                  // }
                  // log('index=${model.index}');
                },
                child: Text('سوال بعدی'),
                style: ElevatedButton.styleFrom(
                  primary: grey3,
                )),
            ElevatedButton(
              onPressed: () {
                // if (model.isEnablePreviousQuestionButton)
                //   model.previousQuestion();
              },
              child: Text('سوال قبلی'),
              style: ElevatedButton.styleFrom(
                primary: grey3,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Container buildBoxWrongAnswer() {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        border: Border.all(
          color: grey2,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 0, left: 0, right: 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: grey2,
            ),
            child: Text(
              'یادت رفته بودا(:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'model.currentQuestion.answer',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Container buildBoxCorrectAnswer() {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
        border: Border.all(
          color: green,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 0, left: 0, right: 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: green,
            ),
            child: Text(
              'درست بود، آفرین (:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'model.currentQuestion.answer',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
