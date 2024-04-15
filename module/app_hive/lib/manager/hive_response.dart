class HiveResponse<T> {
  final T? data;
  final String message;
  final bool hasError;

  bool get hasData => data != null;

  HiveResponse({
    this.data,
    required this.message,
    required this.hasError,
  });
}
