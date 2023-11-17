import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hero_animation/radial_expression.dart';

void main(List<String> args) {
  timeDilation = 13;
  // runApp(Myapps());
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RadialExpansionDemo(),
  ));
}



/*
class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: PhotoHero(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                        builder: (_) => EarthPage()
                        ),
                        );
                },
                width: 250,
                photo: "assets/earth.png",
              ),
            ),
          );
        }
      ),
    );
  }
}
*/