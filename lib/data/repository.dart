import 'dart:convert';

import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/model/response.dart';
import 'package:sample_flutter_web_app/util/constants.dart';

import 'package:http/http.dart' as http;

abstract class QuestionRepository {
  Future<List<Question>> fetchQuestions(String phone);
  Future<String> fetchStatus(String phone);
}

class QuestionRepositoryImpl implements QuestionRepository {

  @override
  Future<List<Question>> fetchQuestions(String phone) async {
    var queryParameters = {
      'sec_code': QUERY_PARAMETER_FIX,
      'mobile': phone,
    };
    // '${BASE_URL}status',queryParameters
    var uri = Uri.https('', '${BASE_URL}status', queryParameters);

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return QuestionResponseData
          .fromJson(jsonDecode(response.body))
          .data
          .questions;
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<String> fetchStatus(String phone) async{
    var queryParameters = {
      'sec_code': QUERY_PARAMETER_FIX,
      'mobile': phone,
    };
    // '${BASE_URL}status',queryParameters
    var uri = Uri.https('', '${BASE_URL}status', queryParameters);

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return QuestionResponseData
          .fromJson(jsonDecode(response.body))
          .data
          .status;
    } else {
      throw NetworkException();
    }
  }

}

class NetworkException implements Exception {}