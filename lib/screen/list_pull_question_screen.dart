import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:sample_flutter_web_app/widget/options_list_pull.dart';

class ListPullQuestionScreen extends StatefulWidget {

  final String phoneNumber;

  ListPullQuestionScreen({required this.phoneNumber});

  @override
  _ListPullQuestionScreenState createState() => _ListPullQuestionScreenState();
}

class _ListPullQuestionScreenState extends State<ListPullQuestionScreen> {


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
    return  Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child
            //model.state == ViewState.Busy
                //? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
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
                        //model.questionState.data != null
                            //?
                      Column(
                          children: [
                            Text('model.currentQuestion.label'),
                            SizedBox(
                              height: 10,
                            ),
                            OptionListPull(widget.phoneNumber),
                          ],
                        ),
                            //: Text('model.questionState.error'),
                        SizedBox(
                          height: 10,
                        ),
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
          ],
        ),
      ),
    );
  }


}