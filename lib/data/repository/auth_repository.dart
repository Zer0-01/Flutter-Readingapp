import 'package:readingapps/data/dio_utils.dart';
import 'package:readingapps/data/endpoints.dart';
import 'package:readingapps/data/models/request/auth_dto_request.dart';
import 'package:readingapps/data/models/request/login_dto_request.dart';
import 'package:readingapps/data/models/request/register_dto_request.dart';
import 'package:readingapps/data/models/response/login_dto_response.dart';
import 'package:readingapps/data/models/response/profile_dto_response.dart';

class AuthRepository {
  Future<void> postAuth(AuthDtoRequest authDtoRequest) async {
    await DioUtils.instance.request(Endpoints.auth, DioMethod.post,
        param: authDtoRequest.toJson());
  }

  Future<void> postRegister(RegisterDtoRequest registerDtoRequest) async {
    await DioUtils.instance.request(Endpoints.register, DioMethod.post,
        param: registerDtoRequest.toJson());
  }

  Future<LoginDtoResponse> postLogin(LoginDtoRequest authDtoRequest) async {
    final response = await DioUtils.instance.request(
        Endpoints.login, DioMethod.post,
        param: authDtoRequest.toJson());

    return LoginDtoResponse.fromJson(response.data);
  }

  Future<ProfileDtoResponse> getProfile() async {
    final response =
        await DioUtils.instance.request(Endpoints.profile, DioMethod.get);

    return ProfileDtoResponse.fromJson(response.data);
  }
}
