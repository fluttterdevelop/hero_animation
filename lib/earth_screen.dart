import 'package:flutter/material.dart';
import 'package:hero_animation/photohero.dart';

class EarthPage extends StatelessWidget {
  const EarthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoHero(
          onTap: () {
            Navigator.of(context).pop();
          },
          width: 500,
          photo: "assets/oq.png",
        ),
      ),
    );
  }
}
