import 'dart:async';

import 'package:idempiere_rest/idempiere_rest.dart';
import 'package:server_repository/api_response.dart';
import 'package:server_repository/models.dart';
import 'package:server_repository/repository.dart';

import '../../constants.dart';
import '../../services/storage/local_storage.dart';

enum CustDetailAppStatus { unknown, error, valid, invalid }

class CustDetailRepo {
  final _controller = StreamController<CustDetailAppStatus>();
  final LocalStorage storage = LocalStorage();
  final UserApiRepository userApiRepository = UserApiRepository();
  final CustomerApiRepository customerApiRepository = CustomerApiRepository();
  final LoginApiRepository loginApiRepository = LoginApiRepository();
  final String userName = ApiConstants.userName;
  final String passWord = ApiConstants.passWord;
  final int roleId = ApiConstants.roleId;

  Stream<CustDetailAppStatus> get status async* {
    String myurl = Uri.base.toString(); //get complete url
    String? para1 = Uri.base.queryParameters["id"];
    if (para1 == null) {
      yield CustDetailAppStatus.invalid;
    } else {
      try{
        String? restAuthToken = await storage.readValue("restauthtoken");
        String? userId = await storage.readValue("userid");
        if (restAuthToken == null) {
          restAuthToken = await _initToken();
          if (restAuthToken == null) {
            yield CustDetailAppStatus.error;
          }
          userId = await storage.readValue("userid");
        }else{
          await IdempiereClient().setRestAuthOfUser(
              int.parse(userId!), restAuthToken!, 1000000, roleId, "en-GB");
          yield CustDetailAppStatus.valid;
        }

      }
      catch(msg , stacktrace){
        yield CustDetailAppStatus.error;
      }

    }
    yield* _controller.stream;
  }

  Future<CBpartner?> getCustomerModel() async{
    String key = Uri.base.queryParameters["id"]!;
    ApiResponse<List<CBpartner>>? result = await customerApiRepository.getCustomerFromSearchKey(key);
    if(result == null){
      _controller.add(CustDetailAppStatus.invalid);
    }
    else if(result.data == null){
      _controller.add(CustDetailAppStatus.invalid);
    }
    else if(result.data!.isEmpty){
      _controller.add(CustDetailAppStatus.invalid);
    }
    else{
      return result?.data?.first;
    }
  }
  Future<String?> _initToken() async {
    bool auth = await loginApiRepository.login(
        username: userName,
        password: passWord,
        clientId: 1000000,
        roleId: roleId,
        lang: "en-GB");
    if (auth) {
      storage.clearValue("username");
      storage.clearValue("restauthtoken");
      storage.clearValue("userid");
      ApiResponse<MUser>? user = await userApiRepository.getUser(userName);
      if (user != null) {
        storage.setValue("username", userName);
        storage.setValue("userid", user!.data!.id!.toString());
        AuthTokenApiRepo auth = AuthTokenApiRepo();
        ApiResponse<RestAuth>? response = await auth.getToken(user!.data!.id!);
        if (response != null) {
          storage.setValue("restauthtoken", response.data!.token!);
          return response.data!.token!;
        }
      }
    }
  }
}
