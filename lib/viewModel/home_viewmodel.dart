import 'package:sample_flutter_web_app/enums/viewstate.dart';
import 'package:sample_flutter_web_app/services/api.dart';
import 'package:sample_flutter_web_app/viewModel/base_viewmodel.dart';
import 'package:sample_flutter_web_app/model/question.dart';

class HomeViewModel extends BaseViewModel{

  Api _api = Api();

  StatusState statusState;

  Future fetchStatus(String phone) async {
    setState(ViewState.Busy);
    statusState = await _api.fetchStatus(phone);
    setState(ViewState.Idle);
  }


}