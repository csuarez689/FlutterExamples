import 'package:flutter/material.dart';
import 'package:shoes_shop/src/helpers/helpers.dart';
import 'package:shoes_shop/src/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {
  ShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    darkStatusBar();
    return Scaffold(
      // body: SearchAppBar(title: 'For you'),
      body: Column(
        children: <Widget>[
          SearchAppBar(title: 'For you'),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(child: ShoePreview(), tag: 'id'),
                  ShoeDescription(
                      title: 'Nike Air Max 720',
                      description:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                ],
              ),
            ),
          ),
          AddCartButton(price: 120.99),
        ],
      ),
    );
  }
}
