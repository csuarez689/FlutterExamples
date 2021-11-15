import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/src/helpers/helpers.dart';
import 'package:shoes_shop/src/models/shoe_model.dart';
import 'package:shoes_shop/src/widgets/custom_widgets.dart';

class ShoeDetailPage extends StatelessWidget {
  ShoeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    lightStatusBar();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(child: ShoePreview(fullScreen: true), tag: 'id'),
              Positioned(
                top: 40,
                child: IconButton(
                    icon: const Icon(Icons.chevron_left, size: 50, color: Colors.white),
                    onPressed: () {
                      darkStatusBar();
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _BuyNow(),
                  _ColorSelector(),
                  _MenuOptions(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Text('\$120.99', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          Spacer(),
          Bounce(from: 8, delay: Duration(milliseconds: 1000), child: CustomButton(text: 'Buy Now', height: 40, width: 120)),
        ],
      ),
    );
  }
}

class _ColorSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 82,
                  child: _CircleColorSelector(
                    color: const Color(0xffcddb3d),
                    index: 4,
                    assetName: 'verde',
                  ),
                ),
                Positioned(
                  left: 54,
                  child: _CircleColorSelector(
                    color: const Color(0xffffb007),
                    index: 3,
                    assetName: 'amarillo',
                  ),
                ),
                Positioned(
                  left: 26,
                  child: _CircleColorSelector(
                    color: const Color(0xff3fa4fc),
                    index: 2,
                    assetName: 'azul',
                  ),
                ),
                _CircleColorSelector(
                  color: const Color(0xff46555a),
                  index: 1,
                  assetName: 'negro',
                ),
              ],
            ),
          ),
          CustomButton(
            text: 'More related items',
            height: 40,
            width: 160,
            color: const Color(0xfffccd85),
          )
        ],
      ),
    );
  }
}

class _CircleColorSelector extends StatelessWidget {
  final Color color;
  final int index;
  final String assetName;
  _CircleColorSelector({this.color = Colors.red, required this.index, required this.assetName});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index * 200),
      child: GestureDetector(
        onTap: () => shoeModel.assetImg = assetName,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MenuOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ShadowIconButon(icon: Icons.favorite, iconColor: Colors.red),
          _ShadowIconButon(icon: Icons.shopping_cart, iconColor: Colors.grey.withOpacity(0.3)),
          _ShadowIconButon(icon: Icons.settings, iconColor: Colors.grey.withOpacity(0.3)),
        ],
      ),
    );
  }
}

class _ShadowIconButon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  _ShadowIconButon({required this.icon, this.iconColor = Colors.grey, this.bgColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            spreadRadius: -5,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: IconButton(onPressed: () {}, icon: Icon(icon, size: 30, color: iconColor)),
    );
  }
}
