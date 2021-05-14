import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:bloc_forms_validation/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';

class ProductService {
  final String _baseUrl =
      'https://flutter-product-66b14-default-rtdb.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = Uri.parse('$_baseUrl/productos.json');
    final res = await http.post(url, body: productModelToJson(product));
    final decodedData = json.decode(res.body);
    print(decodedData);
    return true;
  }

  Future<bool> updateProduct(ProductModel product) async {
    final url = Uri.parse('$_baseUrl/productos/${product.id}.json');
    final res = await http.put(url, body: productModelToJson(product));
    final decodedData = json.decode(res.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductModel>> listProducts() async {
    final url = Uri.parse('$_baseUrl/productos.json');
    final res = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(res.body);
    List<ProductModel> products = [];
    if (decodedData != null) {
      decodedData.forEach((id, prod) {
        final prodTem = ProductModel.fromJson(prod);
        prodTem.id = id;
        products.add(prodTem);
      });
    }
    return products;
  }

  Future<bool> deleteProduct(String id) async {
    final url = Uri.parse('$_baseUrl/productos/$id.json');
    final res = await http.delete(url);
    print(json.decode(res.body));
    return true;
  }

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/csuarez/image/upload?upload_preset=sexg0x2m');
    final mimeType = mime(image.path);
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', image.path,
        contentType: MediaType(mimeType[0], mimeType[1]));
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Error al subir imagen');
      return null;
    }
    return json.decode(resp.body)['secure_url'];
  }
}
