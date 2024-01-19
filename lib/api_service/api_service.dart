class Result<T> {
  Result({
    required this.model,
    required this.errorMessage,
  });

  final String? errorMessage;
  final T? model;
}

class ApiService {}

  
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


