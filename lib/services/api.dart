import 'dart:convert';
import 'dart:developer';

import 'package:sample_flutter_web_app/util/constants.dart';
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/model/response.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  Future<StatusState> fetchStatus(String phoneNumber) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              '${BASE_URL}status?mobile=${phoneNumber}&sec_code=$QUERY_PARAMETER_FIX'),
          headers: {'Accept': 'application/json'});
      log('response=${response.body}');
      if (response.statusCode == 200) {
        final status = QuestionResponseData.fromJson(jsonDecode(response.body))
            .data
            ?.status;

        return StatusState(data: status, error: null);
      } else {
        log('error=${response.toString()}');
        return StatusState(data: null, error: 'خطا در ارتباط با سرور');
      }
    } catch (e) {
      log('exceppoin=$e');
      return StatusState(data: null, error: 'خطا در ارتباط با سرور');
    }
  }

  Future<int> fetchUserStatus(String phoneNumber) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              '${BASE_URL}status?mobile=${phoneNumber}&sec_code=$QUERY_PARAMETER_FIX'),
          headers: {'Accept': 'application/json'});
      log('response=${response.body}');
      if (response.statusCode == 200) {
        final status = QuestionResponseData.fromJson(jsonDecode(response.body))
            .data
            ?.status;

        return status == null ? 0 : status;
      } else {
        log('error=${response.toString()}');
        throw Exception('خطا در ارتباط با سرور');
      }
    } catch (e) {
      log('exceppoin=$e');
      throw Exception(e.toString());
    }
  }

  Future<ResponsePostAnswer> postAnswer(
      String phoneNumber, int label, int answer) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              '${BASE_URL}answer?mobile=${phoneNumber}&sec_code=$QUERY_PARAMETER_FIX'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(<String, int>{'label': label, 'answer': answer}));
      log('label=$label,answer=$answer');
      log('response=${response.body.toString()}');
      if (response.statusCode == 200) {
        return ResponsePostAnswer(data: "data", error: null);
      } else {
        log('error=${response.toString()}');
        return ResponsePostAnswer(data: null, error: 'خطا در ارتباط با سرور');
      }
    } catch (e) {
      log('exceppoin=$e');
      return ResponsePostAnswer(data: null, error: 'خطا در ارتباط با سرور');
    }
  }

  Future<List<Question>> fetchQuestions(String phoneNumber) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              '${BASE_URL}status?mobile=${phoneNumber}&sec_code=$QUERY_PARAMETER_FIX'),
          headers: {'Accept': 'application/json'});
      log('response=${response.body}');
      if (response.statusCode == 200) {
        List<Question> questions = [];

        // final List<Question>? questions = QuestionResponseData.fromJson(jsonDecode(response.body)).data?.questions;
        final List<Question>? tempResponse =
            QuestionResponseData.fromJson(jsonDecode(response.body))
                .data
                ?.questions;
        if (tempResponse != null) questions.addAll(tempResponse);

        if (questions.isNotEmpty) {
          log('size=${questions.length}');
          for (var question in questions) {
            var id = 0;
            for (var answer in question.answers) {
              var option = answer;
              if (option == null) option = '';
              question.answerModels.add(Answer(id, option));
              id++;
            }
            id = 0;
          }
        }

        return questions;
      } else {
        log('error=${response.toString()}');
        throw Exception('خطا در ارتباط با سرور');
      }
    } catch (e) {
      log('exceppoin=$e');
      throw Exception(e.toString());
    }
  }
}
