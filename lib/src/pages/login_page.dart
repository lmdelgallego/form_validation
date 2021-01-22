import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1)
          ],
        ),
      ),
    );
    final circulo = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 155, 0.05),
      ),
    );

    return Stack(
      children: [
        fondoMorado,
        Positioned(top: 90, left: 30, child: circulo),
        Positioned(top: -40, right: -30, child: circulo),
        Positioned(bottom: -50, right: -10, child: circulo),
        Positioned(bottom: 120, right: 20, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Icon(
                Icons.person_pin_circle_outlined,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(height: 10, width: double.infinity),
              Text(
                'Luis Del Gallego',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        )
      ],
    );
  }
}
