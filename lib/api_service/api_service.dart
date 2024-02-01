import 'package:fruit/api_service/api_connect.dart';
import 'package:fruit/model/app_user.dart';
import 'package:fruit/model/point_history/point_history.dart';

class Result<T> {
  Result({
    required this.model,
    required this.errorMessage,
  });

  final String? errorMessage;
  final T? model;
}

String? token;

class ApiService {
  //登入
  static Future<Result<AppUser>> loginUser(AppUser user) async {
    var result = await ApiClinet.connectApi(
        apiAction: ApiAction.login,
        httpMethod: HttpMethods.post,
        header: HttpHeader.json,
        withToken: false,
        parameter: user.toJson(isEncryptPassword: true));
    if (result.errorMessage != null) {
      return Result<AppUser>(
        model: null,
        errorMessage: result.errorMessage,
      );
    } else {
      return Result<AppUser>(
        model: AppUser.fromJson(result.model),
        errorMessage: null,
      );
    }
  }

  //註冊
  static Future<Result<AppUser>> regisUser(AppUser user) async {
    var result = await ApiClinet.connectApi(
        apiAction: ApiAction.regis,
        httpMethod: HttpMethods.post,
        header: HttpHeader.json,
        withToken: false,
        parameter: user.toJson(isEncryptPassword: true));
    if (result.errorMessage != null) {
      return Result<AppUser>(
        model: null,
        errorMessage: result.errorMessage,
      );
    } else {
      return Result<AppUser>(
        model: AppUser.fromJson(result.model),
        errorMessage: null,
      );
    }
  }

  //點數歷史紀錄 pointHistory
  static Future<Result<PointHistoryModel>> getPointHistory() async {
    var result = await ApiClinet.connectApi(
        apiAction: ApiAction.pointHistory,
        httpMethod: HttpMethods.get,
        header: HttpHeader.json,
        withToken: true,
        parameter: null);
    if (result.errorMessage != null) {
      return Result<PointHistoryModel>(
        model: null,
        errorMessage: result.errorMessage,
      );
    } else {
      return Result<PointHistoryModel>(
        model: PointHistoryModel.fromJson(result.model),
        errorMessage: null,
      );
    }
  }
}
