
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/repository/main_repository.dart';
import 'package:sample_flutter_web_app/services/api.dart';

class MainRepositoryImpl extends MainRepository{

  final Api apiService;

  MainRepositoryImpl({required this.apiService});

  @override
  Future<int> fetchUserStatus(String phoneNumber) {
    return apiService.fetchUserStatus(phoneNumber);
  }

  @override
  Future<List<Question>> fetchQuestions(String phoneNumber) {
    return apiService.fetchQuestions(phoneNumber);
  }

}