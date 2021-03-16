import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/cubit/status_state.dart';
import 'package:sample_flutter_web_app/data/repository.dart';
import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:sample_flutter_web_app/widget/options_list.dart';
import 'package:sample_flutter_web_app/cubit/question_cubit.dart';
import 'package:sample_flutter_web_app/cubit/question_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListQuestionScreen extends StatelessWidget {

  final String phoneNumber;

  ListQuestionScreen({this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => QuestionCubit(QuestionRepositoryImpl()),
      child: Scaffold(
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              height: 200,
              child: Image(image: AssetImage('images/spring.png')),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: grey1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: BlocConsumer<QuestionCubit, QuestionState>(

                    ),
                  ),
                  // OptionList(),
                  TextButton(
                    onPressed: (){},
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      child: Text(
                        'گزینه ی اول',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Container(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
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
                              'اولین سفارشت دفتر داستان و تخته بود.',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Container(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
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
                              'اولین سفارشت دفتر داستان و تخته بود.',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Text('سوال بعدی'),
                          style: ElevatedButton.styleFrom(
                            primary: grey3,
                          )),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('سوال قبلی'),
                        style: ElevatedButton.styleFrom(
                          primary: grey1,
                          textStyle: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ),
          ]),
        ),
      ),
    );
  }

  Container buildBoxWrongAnswer(){
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
              borderRadius:
              BorderRadius.all(Radius.circular(8.0)),
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
              'اولین سفارشت دفتر داستان و تخته بود.',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Container buildBoxCorrectAnswer(){
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
              borderRadius:
              BorderRadius.all(Radius.circular(8.0)),
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
              'اولین سفارشت دفتر داستان و تخته بود.',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
