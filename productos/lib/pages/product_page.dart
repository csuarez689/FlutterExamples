import 'dart:io';

import 'package:bloc_forms_validation/models/product_model.dart';
import 'package:bloc_forms_validation/services/product_service.dart';
import 'package:bloc_forms_validation/utils/utils.dart' as utils;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductPage extends StatefulWidget {
  static const String routeName = 'product';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final _productService = new ProductService();
  bool _guardando = false;
  ProductModel _product;
  File image;

  @override
  Widget build(BuildContext context) {
    final ProductModel prodData =
        ModalRoute.of(context).settings.arguments as ProductModel;
    _product = prodData ?? new ProductModel();

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () => _selectImage(ImageSource.gallery),
          ),
          IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () => _selectImage(ImageSource.camera)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _showPhoto(),
                _nameField(),
                _priceField(),
                _switchAvailable(),
                _submitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameField() {
    return TextFormField(
      initialValue: _product.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => _product.titulo = value,
      validator: (value) =>
          value.length < 3 ? 'Ingrese nombre del producto' : null,
    );
  }

  Widget _priceField() {
    return TextFormField(
        initialValue: _product.valor.toString(),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: 'Precio'),
        onSaved: (value) => _product.valor = num.parse(value) / 1,
        validator: (value) =>
            utils.isNumeric(value) ? null : 'Debe ingresar un precio valido');
  }

  Widget _submitButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      icon: Icon(Icons.save),
      onPressed: _guardando ? null : _submit,
      label: Text('Guardar'),
    );
  }

  Widget _switchAvailable() {
    return SwitchListTile(
      value: _product.disponible,
      title: Text('Disponible'),
      activeColor: Theme.of(context).primaryColor,
      onChanged: (value) => setState(() => _product.disponible = value),
    );
  }

  void _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() => _guardando = true);

      if (image != null) {
        _product.fotoUrl = await _productService.uploadImage(image);
      }

      if (_product.id != null)
        await _productService.updateProduct(_product);
      else
        await _productService.createProduct(_product);
      _showSnack("Registro guardado");
      Navigator.pop(context, true);
    }
  }

  void _showSnack(String mensaje) {
    final snack = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  Widget _showPhoto() {
    //TODO: arreglar esto
    if (_product.fotoUrl != null)
      return FadeInImage(
        placeholder: AssetImage('assets/images/jar-loading.gif'),
        image: NetworkImage(_product.fotoUrl),
        height: 300,
        width: double.infinity,
        fit: BoxFit.contain,
      );
    return (image != null)
        ? Image.file(image, height: 300, fit: BoxFit.fill)
        : Image.asset('assets/images/no-image.png',
            height: 300, fit: BoxFit.fill);
  }

  void _selectImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);
    if (image == null) {
      _product.fotoUrl = null;
    }
    setState(() => image = File(pickedFile.path));
  }
}
