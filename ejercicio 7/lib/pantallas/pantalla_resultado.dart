import 'package:flutter/material.dart';

class PantallaResultado extends StatelessWidget {
  final bool exito;
  final String contrasenaUsuario;

  PantallaResultado({required this.exito, required this.contrasenaUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exito ? '¡Éxito!' : 'Fallo',
            style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: exito ? Colors.green : Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              exito ? Icons.check_circle : Icons.error,
              color: exito ? Colors.green : Colors.red,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              exito
                  ? '¡Contraseña correcta!: $contrasenaUsuario'
                  : 'Contraseña incorrecta: $contrasenaUsuario',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Regresar',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:Colors.white

                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 100.0),
                backgroundColor: exito ? Colors.green : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
