import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_3/core/networking/api_result.dart';
import 'package:week_3/core/utils/constants.dart';
import 'package:week_3/features/login/data/models/login_request_body.dart';
import 'package:week_3/features/login/data/repos/login_repo.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/dio_factory.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.idle());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const LoginState.loading());

    try {
      final response = await _loginRepo.login(
        LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      response.when(
        success: (loginResponse) async {
          await saveUserToken(loginResponse.accessToken);
          emit(LoginState.success(loginResponse));
        },
        failure: (error) {
          emit(
            LoginState.error(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        const LoginState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(
      key: SharedPrefKeys.userToken,
      value: token,
    );

    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
