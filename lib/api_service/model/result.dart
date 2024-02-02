class Result<T> {
  Result({
    required this.model,
    required this.errorMessage,
  });

  final String? errorMessage;
  final T? model;
}
