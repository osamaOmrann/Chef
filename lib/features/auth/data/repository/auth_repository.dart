import 'package:chef/core/database/api/api_consumer.dart';
import 'package:chef/core/database/api/end_points.dart';
import 'package:chef/core/error/exceptions.dart';
import 'package:chef/core/services/service_locator.dart';
import 'package:chef/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  Future<Either<String, LoginModel>> login(
      {required String email, required String password}) async {
    try {
      final response = await sl<APIConsumer>().post(EndPoint.chefSignIn, data: {
        APIKeys.email: email,
        APIKeys.password: password,
      });
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await sl<APIConsumer>()
          .post(EndPoint.sendCode, data: {APIKeys.email: email});
      return Right(response[APIKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> resetPassword(
      {required String email,
      required String password,
      required String confirmPassword,
      required String code}) async {
    try {
      final response =
          await sl<APIConsumer>().patch(EndPoint.changeForgottenPassword, data: {
        APIKeys.email: email,
        APIKeys.password: password,
        APIKeys.confirmPassword: confirmPassword,
        APIKeys.code: code
      });
      return Right(response[APIKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
