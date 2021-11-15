import 'package:flutter/material.dart';
import 'package:shoes_shop/src/widgets/custom_widgets.dart';

class AddCartButton extends StatelessWidget {
  final double price;

  AddCartButton({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: <Widget>[
          Text('\$$price', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Spacer(),
          CustomButton(text: 'Add to cart'),
        ],
      ),
    );
  }
}
