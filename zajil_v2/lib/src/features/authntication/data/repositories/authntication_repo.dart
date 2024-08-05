import 'package:dartz/dartz.dart';
import 'package:zajil_v2/src/core/api/error_handler.dart';
import 'package:zajil_v2/src/core/api/failure.dart';
import 'package:zajil_v2/src/features/authntication/data/datasources/authentication_data_source.dart';
import 'package:zajil_v2/src/features/authntication/data/models/login_request.dart';
import 'package:zajil_v2/src/features/authntication/data/models/login_response.dart';
import 'package:zajil_v2/src/features/authntication/data/models/register_request.dart';

class AuthnticationRepoImplmenter {
  final AuthnticationDataSource dataSource;

  AuthnticationRepoImplmenter({required this.dataSource});

  Future<Either<Failure, LoginResponse>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      var result = await dataSource.login(loginRequestModel);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, LoginResponse>> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      var result = await dataSource.register(registerRequestModel);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
