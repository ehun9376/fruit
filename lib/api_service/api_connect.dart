import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fruit/api_service/api_service.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

enum HttpMethods { get, post, put, delete, patch }

enum ApiAction {
  ///登入
  authLogin,

  ///註冊
  authRegis,

  ///刪除帳號
  appUser,

  ///傳送訂閱狀態
  appUserSubscribe,

  ///工作分類
  category,

  ///工作分類列表
  categoryList,

  ///老人相關
  elderly,

  ///老人列表
  elderlyList,

  ///家屬相關
  entourage,

  ///家屬排序
  entourageSequences,

  ///家屬列表
  entourageList,

  ///上傳檔案
  presignedURLs,

  ///工作紀錄相關
  record,

  ///工作記錄列表
  recordList,

  ///工作記錄列表最新
  recordListLatest,

  ///任務相關
  task,

  ///任務列表
  taskList,

  ///上傳檔案
  uploads
}

extension ApiActionName on ApiAction {
  String get path {
    switch (this) {
      case ApiAction.authLogin:
        return 'auth/login';
      case ApiAction.authRegis:
        return 'auth/register';
      case ApiAction.appUser:
        return 'appuser';
      case ApiAction.appUserSubscribe:
        return 'appuser/subscriptions';
      case ApiAction.category:
        return 'category';
      case ApiAction.categoryList:
        return 'category/list';
      case ApiAction.elderly:
        return 'elderly';
      case ApiAction.elderlyList:
        return 'elderly/list';
      case ApiAction.entourage:
        return 'entourage';
      case ApiAction.entourageSequences:
        return 'entourage/sequences';
      case ApiAction.entourageList:
        return 'entourage/list';
      case ApiAction.presignedURLs:
        return 'presigned-urls';
      case ApiAction.record:
        return 'record';
      case ApiAction.recordList:
        return 'record/list';
      case ApiAction.recordListLatest:
        return 'record/latest';
      case ApiAction.task:
        return 'task';
      case ApiAction.taskList:
        return 'task/list';
      case ApiAction.uploads:
        return 'uploads';
    }
  }
}

enum HttpHeader { json, form, none }

extension HeaderValue on HttpHeader {
  Map<String, String> get header {
    switch (this) {
      case HttpHeader.json:
        return {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
      case HttpHeader.form:
        return {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        };
      case HttpHeader.none:
        return {};
    }
  }
}

class ApiClinet {
  // kDebugMode ? "https://caretale-api-dev.icavemen.com" : "";
  static const String _baseUrl = "https://caretale-api-dev.icavemen.com";
  // kDebugMode ? "https://caretale-api-dev.icavemen.com" : "";

  static Future<Result<dynamic>> connectApi(
      {HttpMethods httpMethod = HttpMethods.post,
      required ApiAction apiAction,
      HttpHeader header = HttpHeader.json,
      String? suffix,
      Map<String, dynamic>? parameter,
      List<Map<String, dynamic>>? listParameter}) async {
    final Uri apiUrl = Uri.parse('$_baseUrl/${apiAction.path}/${suffix ?? ''}');

    Response? response;
    parameter?.removeWhere((key, value) =>
        value == null ||
        (value is String && value.isEmpty) ||
        (value is List && value.isEmpty));
    listParameter?.removeWhere((element) => element.isEmpty);
    switch (httpMethod) {
      case HttpMethods.get:
        response = await http.get(
          apiUrl,
          headers: header.header,
        );
        break;
      case HttpMethods.post:
        response = await http.post(
          apiUrl,
          headers: header.header,
          body: jsonEncode(parameter ?? listParameter),
        );

        break;
      case HttpMethods.put:
        response = await http.put(
          apiUrl,
          headers: header.header,
          body: jsonEncode(parameter ?? listParameter),
        );
        break;
      case HttpMethods.delete:
        response = await http.delete(
          apiUrl,
          headers: header.header,
          body: jsonEncode(parameter ?? listParameter),
        );
        break;

      case HttpMethods.patch:
        response = await http.patch(
          apiUrl,
          headers: header.header,
          body: jsonEncode(parameter ?? listParameter),
        );

        break;
    }

    debugPrint(
        "ApiClinet:  request URL :$apiUrl  \nbody: ${jsonEncode(parameter ?? listParameter)}");

    debugPrint(
        "ApiClinet:  statusCode :${response.statusCode} \n body: ${response.body}");

    if (response.statusCode == 200) {
      return Result(
          model: response.body.isNotEmpty ? json.decode(response.body) : null,
          errorMessage: null);
    } else {
      return Result(
          model: null,
          errorMessage: "Http error: ${response.statusCode.toString()}");
    }
  }

  // static Future<Result<List<PhotoModel>>> uploadFileApi(
  //     {ApiAction apiAction = ApiAction.uploads,
  //     HttpHeader header = HttpHeader.json,
  //     String? suffix,
  //     required List<UploadResult> photos}) async {
  //   final Uri apiUrl = Uri.parse('$_baseUrl/${apiAction.path}/${suffix ?? ''}');

  //   debugPrint("uploadFileApi URL: $apiUrl \n body: ${json.encode(photos)} ");
  //   Response? response = await http.post(apiUrl,
  //       headers: header.header, body: json.encode(photos));

  //   if (response.statusCode == 200) {
  //     List<PhotoModel> photoModelList = [];

  //     debugPrint("uploadFileApi Respond: ${response.body}");

  //     List<dynamic> fileObjList = json.decode(response.body);

  //     photoModelList =
  //         fileObjList.map<PhotoModel>(((e) => PhotoModel.fromJson(e))).toList();
  //     for (var photo in photos) {
  //       photoModelList
  //           .firstWhere((element) => element.fileName == photo.filename)
  //           .stagingBucketGuid = photo.stagingBucketGuid;
  //     }

  //     return Result(model: photoModelList, errorMessage: null);
  //   } else {
  //     return Result(
  //         model: null,
  //         errorMessage: "Http error: ${response.statusCode.toString()}");
  //   }
  // }

  // static Future<Result<List<UploadResult>>> uploadFiles(
  //     List<File> files) async {
  //   if (files.isEmpty) {
  //     var result = Result<List<UploadResult>>(
  //         model: null, errorMessage: "File is empty.");
  //     return result;
  //   }
  //   var filesMap = {
  //     for (var file in files)
  //       file.uri.pathSegments.last: {
  //         "file": file,
  //         "contentType": lookupMimeType(file.path),
  //         "path": file.path,
  //       },
  //   };
  //   for (var entry in filesMap.entries) {
  //     debugPrint(entry.key);
  //     debugPrint(entry.value["contentType"]?.toString());
  //     debugPrint(entry.value["path"].toString());
  //   }
  //   var presignRequestParameter = {
  //     "FileNames": files.map((e) => e.uri.pathSegments.last).toList()
  //   };
  //   var encoded =
  //       base64Encode(utf8.encode(jsonEncode(presignRequestParameter)));
  //   var apiUri = Uri.parse(_baseUrl);
  //   var url = Uri(
  //     scheme: apiUri.scheme,
  //     host: apiUri.host,
  //     port: apiUri.port,
  //     path: "/presigned-urls/$encoded",
  //   );
  //   debugPrint(url.path);
  //   var presignedResponse = await http.get(url);
  //   if (presignedResponse.statusCode != 200) {
  //     debugPrint("presigned failed");
  //     debugPrint(presignedResponse.body.toString());
  //     return Result<List<UploadResult>>(
  //         model: null, errorMessage: "頭像更新失敗，請洽客服。");
  //   }
  //   var json = jsonDecode(presignedResponse.body.toString());
  //   debugPrint(presignedResponse.body.toString());
  //   var presignedResult = PresignedResult.fromJson(json);

  //   var uploads = <Future<Response>>[];
  //   for (var presignedUrl in presignedResult.preSignedUrls.entries) {
  //     var target = filesMap[presignedUrl.key];
  //     var file = target!["file"]! as File;
  //     var fileContent = await file.readAsBytes();
  //     debugPrint("${presignedUrl.value}");
  //     var task = http.put(
  //       Uri.parse(presignedUrl.value),
  //       headers: {
  //         "Content-Type": target["contentType"]!.toString(),
  //       },
  //       body: fileContent,
  //     );
  //     uploads.add(task);
  //   }

  //   var uploadresponses = await Future.wait(uploads);
  //   for (var result in uploadresponses) {
  //     if (result.statusCode != 200) {
  //       debugPrint("upload failed");
  //       debugPrint(result.body.toString());
  //     }
  //   }

  //   var finalUploads = filesMap.entries
  //       .map(
  //         (e) => UploadResult(
  //           filename: e.key,
  //           stagingBucketGuid: presignedResult.folderGuid,
  //           mimetype: e.value["contentType"]!.toString(),
  //         ),
  //       )
  //       .toList();

  //   debugPrint("===> Upload completed: $finalUploads");

  //   return Result<List<UploadResult>>(model: finalUploads, errorMessage: null);
  // }
}
