import 'package:fruit/api_service/api_connect.dart';
import 'package:fruit/model/app_user.dart';

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
}

  
  // static Future<Result<DefaultMessageModel>> updateRecord(
  //     RecordModel model) async {
  //   Result<dynamic> result = await ApiClinet.connectApi(
  //       apiAction: ApiAction.record,
  //       httpMethod: HttpMethods.patch,
  //       suffix: model.id,
  //       parameter: model.toJson());
  //   if (result.errorMessage != null) {
  //     return Result<DefaultMessageModel>(
  //       model: null,
  //       errorMessage: result.errorMessage,
  //     );
  //   } else {
  //     return Result<DefaultMessageModel>(
  //       model: DefaultMessageModel.fromJson(result.model),
  //       errorMessage: null,
  //     );
  //   }
  // }


