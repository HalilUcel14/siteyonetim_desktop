class HiveResponse<T> {
  final T? data;
  final String message;
  final bool hasError;

  HiveResponse({
    this.data,
    required this.message,
    required this.hasError,
  });
}
