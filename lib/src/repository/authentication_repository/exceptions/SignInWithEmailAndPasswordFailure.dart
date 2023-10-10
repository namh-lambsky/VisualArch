
class SignInWithEmailAndPasswordFailure {
  final String message;

  const SignInWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred."]);

  factory SignInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure(
            'Este usuario fue deshabilitado, consulte con soporte para obtener una solución');
      case 'invalid-email':
        return const SignInWithEmailAndPasswordFailure(
            'El formato del correo es incorrecto');
      case 'user-not-found':
        return const SignInWithEmailAndPasswordFailure(
            'El usuario no fue encontrado');
      case 'invalid_login_credentials':
        return const SignInWithEmailAndPasswordFailure(
            'El usuario o la contraseña son incorrectas');
      case 'wrong-password':
        return const SignInWithEmailAndPasswordFailure(
            'Contraseña Inconrrecta');
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure(
            'Usuario desahibilitado, contacte con soporte para obtener una solución');
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }
}
