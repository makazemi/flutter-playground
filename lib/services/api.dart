import 'dart:convert';
import 'dart:developer';

import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/model/response.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {

  Future<QuestionState> fetchQuestions(String phoneNumber) async {

    try {
      http.Response response = await http.get(
          Uri.parse(
              '${BASE_URL}status?mobile=${phoneNumber}&sec_code=$QUERY_PARAMETER_FIX'),
          headers: {'Accept': 'application/json'});
      log('response=${response.body}');
      if (response.statusCode == 200) {

        final List<Question> questions = QuestionResponseData.fromJson(jsonDecode(response.body))
            .data
            .questions;

        log('size=${questions.length}');
        for(var question in questions){
          var id=0;
          for(var answer in question.answers){
            var option=answer;
            if(option==null)
              option='';
            question.answerModels.add(Answer(id,option));
            id++;
          }
          id=0;
        }


        return QuestionState(data:questions,error: null);
      } else {
        log('error=${response.toString()}');
        return QuestionState(data: null,error: 'خطا در ارتباط با سرور');
      }
    } catch (e) {
      log('exceppoin=$e');
      return QuestionState(data: null,error: 'خطا در ارتباط با سرور');
    }
  }


}