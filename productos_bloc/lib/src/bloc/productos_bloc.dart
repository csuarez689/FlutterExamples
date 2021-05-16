import 'dart:io';

import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:rxdart/rxdart.dart';

import 'package:formvalidation/src/models/producto_model.dart';

class ProductosBloc {
  final _productosController = new BehaviorSubject<List<ProductoModel>>();
  final _loaderController = new BehaviorSubject<bool>();
  final _productosProvider = new ProductosProvider();

  Stream<List<ProductoModel>> get productosStream =>
      _productosController.stream;
  Stream<bool> get loaderStream => _loaderController.stream;

  Function(bool) get _setLoader => _loaderController.sink.add;

  Future<void> cargarProductos() async {
    _setLoader(true);
    final productos = await _productosProvider.cargarProductos();
    _productosController.sink.add(productos);
    _setLoader(false);
  }

  Future<void> agreagarProducto(ProductoModel producto) async {
    _setLoader(true);
    await _productosProvider.crearProducto(producto);
    _setLoader(false);
  }

  Future<String> subirImagen(File file) async {
    _setLoader(true);
    final urlFoto = await _productosProvider.subirImagen(file);
    _setLoader(false);
    return urlFoto;
  }

  Future<void> editarProducto(ProductoModel producto) async {
    _setLoader(true);
    await _productosProvider.editarProducto(producto);
    _setLoader(false);
  }

  //no lleva loader porque es utilizado con DISMSSIBLE
  Future<void> borrarProducto(String id) async {
    await _productosProvider.borrarProducto(id);
  }

  dispose() {
    _productosController?.close();
    _loaderController?.close();
  }
}
