import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
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

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5),
                    spreadRadius: 3.0,
                  )
                ]),
            child: Column(
              children: [
                Text('Ingreso', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                _crearEmail(),
                SizedBox(height: 30),
                _crearPassword(),
                SizedBox(height: 30),
                _crearBoton(),
              ],
            ),
          ),
          Text('Forgot password?'),
          SizedBox(height: 100)
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'ejemplo@correo.com',
          labelText: 'E-mail',
        ),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Colors.deepPurple),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: () {},
    );
  }
}
