
class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Por favor ingrese una contraseña más segura');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'El formato del correo es incorrecto');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'El correo ya esta en uso');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operación no permitida, consulte con soporte para obtener una solución');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'Usuario desahibilitado, contacte con soporte para obtener una solución');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
