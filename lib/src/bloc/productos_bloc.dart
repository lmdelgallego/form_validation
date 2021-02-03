import 'dart:io';

import 'package:form_validation/src/providers/productos_providers.dart';
import 'package:rxdart/rxdart.dart';

import 'package:form_validation/src/models/producto.dart';

class ProductosBloc {
  final _productosCotroller = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoCotroller = new BehaviorSubject<bool>();

  final _productosProvider = new ProductosProvider();

  Stream<List<ProductoModel>> get productosStream => _productosCotroller.stream;
  Stream<bool> get cargando => _cargandoCotroller.stream;

  void cargarProductos() async {
    final productos = await _productosProvider.cargarProductos();
    _productosCotroller.sink.add(productos);
  }

  void agregarProductos(ProductoModel producto) async {
    _cargandoCotroller.sink.add(true);
    await _productosProvider.crearProducto(producto);
    _cargandoCotroller.sink.add(false);
  }

  Future<String> subirFoto(File foto) async {
    _cargandoCotroller.sink.add(true);
    final fotoUrl = await _productosProvider.subirImagen(foto);
    _cargandoCotroller.sink.add(false);
    return fotoUrl;
  }

  void editarProductos(ProductoModel producto) async {
    _cargandoCotroller.sink.add(true);
    await _productosProvider.editarProducto(producto);
    _cargandoCotroller.sink.add(false);
  }

  void borrarProductos(String id) async {
    await _productosProvider.borrarProducto(id);
  }

  dispose() {
    _productosCotroller?.close();
    _cargandoCotroller?.close();
  }
}
