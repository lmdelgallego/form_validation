import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:form_validation/src/models/producto.dart';

class ProductosProvider {
  final String _url = 'https://goalcoach-a4187.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';
    final response = await http.post(url, body: productoModelToJson(producto));

    final decodeData = json.decode(response.body);
    print(decodeData);
    return true;
  }
}
