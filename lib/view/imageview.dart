import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Imageview extends StatelessWidget {
  Imageview({Key? key, required this.image}) : super(key: key);
  dynamic image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("${image}"))),
      ),
    );
  }
}
