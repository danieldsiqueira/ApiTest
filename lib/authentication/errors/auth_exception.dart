class AuthException implements Exception {
  String message;

  AuthException([String? message])
      : message =
            message ?? 'Ocorreu um erro inesperado durante a autenticação.';

  @override
  String toString() => message;
}
