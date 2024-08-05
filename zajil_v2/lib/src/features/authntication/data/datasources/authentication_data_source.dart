import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/api/dio_factory.dart';
import 'package:zajil_v2/src/features/authntication/data/models/login_request.dart';
import 'package:zajil_v2/src/features/authntication/data/models/login_response.dart';
import 'package:zajil_v2/src/features/authntication/data/models/register_request.dart';

class AuthnticationDataSource {
  Future<LoginResponse> login(LoginRequestModel loginRequestModel) async {
    var result = await DioFactory.postdata(
        url: EndPoints.login, data: loginRequestModel.toMap());
    return LoginResponse.fromJson(result.data);
  }

  Future<LoginResponse> register(
      RegisterRequestModel registerRequestModel) async {
    var result = await DioFactory.postdata(
        url: EndPoints.register, data: registerRequestModel.toMap());
    return LoginResponse.fromJson(result.data);
  }
}
