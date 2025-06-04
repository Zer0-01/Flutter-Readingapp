import 'package:readingapps/data/dio_utils.dart';
import 'package:readingapps/data/endpoints.dart';
import 'package:readingapps/data/models/request/auth_dto_request.dart';
import 'package:readingapps/data/models/request/login_dto_request.dart';
import 'package:readingapps/data/models/request/register_dto_request.dart';

class AuthRepository {
  Future<void> postAuth(AuthDtoRequest authDtoRequest) async {
    await DioUtils.instance.request(Endpoints.auth, DioMethod.post,
        param: authDtoRequest.toJson());
  }

  Future<void> postRegister(RegisterDtoRequest registerDtoRequest) async {
    await DioUtils.instance.request(Endpoints.register, DioMethod.post,
        param: registerDtoRequest.toJson());
  }

  Future<void> postLogin(LoginDtoRequest authDtoRequest) async {
    await DioUtils.instance.request(Endpoints.login, DioMethod.post,
        param: authDtoRequest.toJson());
  }
}
