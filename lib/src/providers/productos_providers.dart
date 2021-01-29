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

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/productos.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();
    if (decodeData == null) return [];

    decodeData.forEach((key, product) {
      final prodTemp = ProductoModel.fromJson(product);
      prodTemp.id = key;
      productos.add(prodTemp);
    });

    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json';
    final resp = await http.delete(url);
    print(json.decode(resp.body));
    return 1;
  }
}
