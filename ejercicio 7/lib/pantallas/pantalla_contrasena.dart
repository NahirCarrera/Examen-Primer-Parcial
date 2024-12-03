import 'package:flutter/material.dart';
import '../logica/verificar_contrasena.dart';
import 'pantalla_resultado.dart';

class PantallaContrasena extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PantallaContrasenaState();
}

class _PantallaContrasenaState extends State<PantallaContrasena> {
  final TextEditingController controladorContrasena = TextEditingController();
  // Variable que guarda la contrasena correcta
  final String contrasena = 'espe1234';
  // Instancia de la clase para verificar contraseña
  late VerificacionContrasena logicaContrasena;

  @override
  void initState() {
    super.initState();
    // Aquí se inicializa logicaContrasena con la contrasena guardada en la variable
    logicaContrasena = VerificacionContrasena(contrasenaCorrecta: contrasena);
  }

  void verificarContrasena() {
    final contrasenaUsuario = controladorContrasena.text;

    // Validar si la contraseña ingresada está vacía
    if (contrasenaUsuario.isEmpty) {
      // Mostrar mensaje de error si la contraseña está vacía
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor ingrese la contraseña'),
          backgroundColor: Colors.red,
        ),
      );
      return; // No proceder con la verificación si está vacía
    }

    final resultado = logicaContrasena.verificar(contrasenaUsuario);

    // Navegar a la pantalla del resultado pasando como parámetro el estado de éxito o fracaso y la contrasena ingresada por el usuario
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PantallaResultado(exito: resultado, contrasenaUsuario: contrasenaUsuario),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verificar Contraseña',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF5B3758),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000505),
              Color(0xFF3B3355),
              Color(0xFF5D5D81),
              Color(0xFFBFCDE0),
              Color(0xFFFEFCFD)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Verificar Contraseña',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.check,
                    size: 50.0,
                    color: Color(0xFF5B3758),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controladorContrasena,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    hintText: 'Contraseña',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xFF5B3758),
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: verificarContrasena,
                  child: Text(
                    'Verificar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 120.0),
                    backgroundColor: Color(0xFF5B3758),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
