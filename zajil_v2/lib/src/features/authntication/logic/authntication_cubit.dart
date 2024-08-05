import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zajil_v2/di.dart';
import 'package:zajil_v2/src/core/api/constant_end_points.dart';
import 'package:zajil_v2/src/core/api/dio_factory.dart';
import 'package:zajil_v2/src/core/shared_prefrence/shared_prefrence.dart';
import 'package:zajil_v2/src/features/authntication/data/datasources/authentication_data_source.dart';
import 'package:zajil_v2/src/features/authntication/data/models/login_request.dart';
import 'package:zajil_v2/src/features/authntication/data/models/register_request.dart';
import 'package:zajil_v2/src/features/authntication/data/repositories/authntication_repo.dart';

part 'authntication_state.dart';

class AuthnticationCubit extends Cubit<AuthnticationState> {
  AuthnticationCubit() : super(AuthnticationInitial());
  AuthnticationRepoImplmenter repoImplmenter =
      AuthnticationRepoImplmenter(dataSource: AuthnticationDataSource());
  void login() {
    emit(LoginLoading());
    LoginRequestModel loginRequestModel = LoginRequestModel(
      email: '',
      password: '',
    );
    repoImplmenter.login(loginRequestModel).then((value) {
      value.fold((failure) {
        emit(LoginFailed(failure.message));
      }, (data) {
        emit(LoginSuccess());
      });
    });
  }

  void register() {
    emit(RegisterLoading());
    RegisterRequestModel registerRequestModel = RegisterRequestModel(
      email: '',
      password: '',
      name: '',
    );
    repoImplmenter.register(registerRequestModel).then((value) {
      value.fold((failure) {
        emit(RegisterFailed(failure.message));
      }, (data) {
        emit(RegisterSuccess());
      });
    });
  }

  TextEditingController phoneEditingController = TextEditingController();

  loginWithPhone() {
    Constants.phoneNumber = phoneEditingController.text;
    DioFactory.getDio();
    getIt<PrefData>().setPhoneNumber(phoneEditingController.text);
    emit(LoginSuccess());
  }
}
