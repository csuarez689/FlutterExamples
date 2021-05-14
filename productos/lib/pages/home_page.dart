import 'package:bloc_forms_validation/models/product_model.dart';
import 'package:bloc_forms_validation/pages/product_page.dart';
import 'package:bloc_forms_validation/services/product_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _productService = new ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
      ),
      body: _createList(),
      floatingActionButton: _floatingButton(context),
    );
  }

  Widget _floatingButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () async {
        await (Navigator.pushNamed(context, ProductPage.routeName));
        setState(() {});
      },
    );
  }

  Widget _createList() {
    return FutureBuilder(
      future: _productService.listProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) =>
                  _listTileItem(context, productos[index]));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _listTileItem(BuildContext context, ProductModel product) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: EdgeInsets.only(right: 10.0),
        color: Colors.red,
        child: Icon(Icons.delete_forever, color: Colors.white, size: 36.0),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) async {
        await _productService.deleteProduct(product.id);
        setState(() {});
      },
      child: Card(
        child: Column(
          children: [
            (product.fotoUrl == null)
                ? Image(image: AssetImage('assets/images/no-image.png'))
                : FadeInImage(
                    placeholder: AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage(product.fotoUrl),
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ListTile(
              title: Text('${product.titulo} - \$${product.valor}'),
              subtitle: Text(product.id),
              onTap: () async {
                await (Navigator.pushNamed(context, ProductPage.routeName,
                    arguments: product));
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
