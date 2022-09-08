class AppException implements Exception {
  final String message;

  AppException([message]) : message = message ?? 'Ocorreu um erro.';

  @override
  String toString() {
    return message;
  }
}
