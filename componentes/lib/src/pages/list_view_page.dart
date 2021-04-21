import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImagesToList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Builder'),
      ),
      body: Stack(
        children: <Widget>[
          _makeListView(),
          _makeLoader(),
        ],
      ),
    );
  }

  Widget _makeListView() => RefreshIndicator(
        onRefresh: getNewPage,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index) => FadeInImage(
            height: 300,
            placeholder: AssetImage('resources/images/17.1 jar-loading.gif'),
            image: NetworkImage(
                'https://picsum.photos/id/${_listaNumeros[index]}/500/300'),
          ),
        ),
      );

  void _addImagesToList() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listaNumeros.add(_lastItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    return await Future.delayed(Duration(seconds: 2), () {
      _isLoading = false;
      _scrollController.animateTo(_scrollController.position.pixels + 100,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      _addImagesToList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _makeLoader() => _isLoading
      ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 20),
            ],
          ),
        )
      : Container();

  Future<void> getNewPage() async {
    _listaNumeros.clear();
    _lastItem++;
    _addImagesToList();
    return Future.delayed(Duration(seconds: 2), () {});
  }
}
