import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/src/models/shoe_model.dart';
import 'package:shoes_shop/src/pages/shoe_detail_page.dart';

class ShoePreview extends StatelessWidget {
  final bool fullScreen;

  ShoePreview({Key? key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ShoeDetailPage()));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: fullScreen ? 0 : 20,
          vertical: fullScreen ? 0 : 5,
        ),
        width: double.infinity,
        height: 420,
        decoration: BoxDecoration(
          color: const Color(0xffffcf53),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: <Widget>[
            _ShoeBox(fullScreen),
            if (!fullScreen) _ShoeSizes(),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ShoeSizeBox(7),
          _ShoeSizeBox(7.5),
          _ShoeSizeBox(8),
          _ShoeSizeBox(8.5),
          _ShoeSizeBox(9),
          _ShoeSizeBox(9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double size;
  _ShoeSizeBox(this.size);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        shoeModel.size = size;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 40,
        decoration: BoxDecoration(
          color: size == shoeModel.size ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (size == shoeModel.size)
              const BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: Text(
          size.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: size == shoeModel.size ? Colors.white : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ShoeBox extends StatelessWidget {
  final bool fullScreen;

  _ShoeBox(this.fullScreen);

  @override
  Widget build(BuildContext context) {
    final img = Provider.of<ShoeModel>(context).assetImg;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fullScreen ? 20 : 40,
        vertical: fullScreen ? 20 : 10,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(child: _ShoeShadow(), bottom: 20, right: 0),
          Image(image: AssetImage('assets/imgs/$img.png')),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.51,
      child: Container(
        width: 270,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Color(0xffeaa14e),
              blurRadius: 40,
              spreadRadius: -5,
              offset: Offset(0, 10),
            ),
          ],
        ),
      ),
    );
  }
}
