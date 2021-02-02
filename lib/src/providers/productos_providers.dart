import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
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

  Future<bool> editarProducto(ProductoModel producto) async {
    final url = '$_url/productos/${producto.id}.json';
    final response = await http.put(url, body: productoModelToJson(producto));

    final decodeData = json.decode(response.body);
    print(decodeData);
    return true;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json';
    final resp = await http.delete(url);
    print(json.decode(resp.body));
    return 1;
  }

  Future<String> subirImagen(File image) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/alucardluis/image/upload?upload_preset=schioqrm');
    final mainType = mime(image.path).split('/');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', image.path,
        contentType: MediaType(mainType[0], mainType[1]));
    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio mal');
      print(resp.body);
      return null;
    }
    final respData = json.decode(resp.body);
    print(respData["secure_url"]);
    return respData["secure_url"];
  }
}
