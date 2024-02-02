enum ApiAction {
  login,
  regis,

  pointHistory,

  getAdsList,
}

extension ApiActionName on ApiAction {
  String get path {
    switch (this) {
      case ApiAction.login:
        return "login";
      case ApiAction.regis:
        return "signup";
      case ApiAction.pointHistory:
        return "users/points/history";
      case ApiAction.getAdsList:
        return "ads";
    }
  }
}
