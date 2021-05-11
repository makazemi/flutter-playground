
import 'package:sample_flutter_web_app/model/question.dart';

abstract class MainRepository{

  Future<int> fetchUserStatus(String phoneNumber);


  Future<List<Question>> fetchQuestions(String phoneNumber);

}