class VerificacionContrasena {
  // Atributo contraseña correcta
  final String contrasenaCorrecta;
  VerificacionContrasena({required this.contrasenaCorrecta});
  // Método para verificar que la contraseña ingresada por el usuario coincida con la correcta
  bool verificar(String contrasenaUsuario) {
    return contrasenaCorrecta.toLowerCase() == contrasenaUsuario.toLowerCase();
  }
}
