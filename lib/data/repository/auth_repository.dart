import 'package:readingapps/data/dio_utils.dart';
import 'package:readingapps/data/endpoints.dart';
import 'package:readingapps/data/models/request/auth_dto_request.dart';

class AuthRepository {
  Future<void> postAuth(AuthDtoRequest authDtoRequest) async {
    await DioUtils.instance.request(Endpoints.auth, DioMethod.post,
        param: authDtoRequest.toJson());
  }
}
