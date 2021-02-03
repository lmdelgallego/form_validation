import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form_validation/src/preferencias_usuario/preferencias_usuario.dart';

class UserProvider {
  final String _fbToken = "AIzaSyArFtSOsqmL0k31tCgy47dPKtffXTasr1o";
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _fbRequestAccount(email, password,
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword');
  }

  Future nuevoUsuario(String email, String password) async {
    return await _fbRequestAccount(email, password,
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp');
  }

  Future<Map<String, dynamic>> _fbRequestAccount(
      String email, String password, String url) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      '$url?key=$_fbToken',
      body: json.encode(authData),
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    return _handlerResponse(decodedResp);
  }

  Map<String, dynamic> _handlerResponse(Map<String, dynamic> decodedResp) {
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  }
}
