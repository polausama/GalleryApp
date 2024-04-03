import 'dart:io';

import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  final File image;
  const ContainerImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(image: FileImage(image)),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
