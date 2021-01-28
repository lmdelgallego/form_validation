import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Container(),
      floatingActionButton: _crearBoton(context),
    );
  }

  FloatingActionButton _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}
