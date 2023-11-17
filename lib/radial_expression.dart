import 'package:flutter/material.dart';
import 'package:hero_animation/photo.dart';
import 'package:hero_animation/radial.dart';

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      Interval(0.0, 0.75, curve: Curves.fastLinearToSlowEaseIn);

  const RadialExpansionDemo({Key? key}) : super(key: key);

  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          // tortburchak shakl ichi default 4 burchak vidget
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: (begin, end) =>
                      MaterialRectCenterArcTween(begin: begin, end: end),
                  tag: imageName,
                  child: RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description, {required TextStyle style}) {
    return Container(
      width: kMinRadius * 3,
      height: kMinRadius * 3,
      child: Hero(
        // radian shu yerda 
        createRectTween: (begin, end) =>
            MaterialRectCenterArcTween(begin: begin, end: end),
        tag: imageName,

        // dumaloq qilib beradi 
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  //necha sekund da chiqishi 
                  pageBuilder: (_, animation, secondaryAnimation) {
                    
                    
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (_, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),
                        );
                      },
                    );
                  },
                ),
              );
            },
            color: Colors.blue,
          ),
        ),
      
      
      
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Hero Animation',
        style: TextStyle(color: Colors.green),),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(
              context,
              'assets/cars/oq.png',
              "Mersades-Bens S63 AMG",
              style:
            TextStyle(color: Colors.pink[100]),
            ),

             _buildHero(
              context,
              'assets/cars/rols.png',
              "Rolls Roys",
              style:
            TextStyle(color: const Color.fromARGB(255, 87, 64, 72)),
            ),
             _buildHero(
              context,
              'assets/cars/gold2.png',
              "Lamborgini gold Arabic sheikh",
              style:
            TextStyle(color: Color.fromARGB(255, 246, 226, 5)),
            ),
             _buildHero(
              context,
              'assets/cars/captiva5.jpeg',
              "Captiva 5 Uzbekistan ",
              style:
            TextStyle(color: Color.fromARGB(255, 248, 3, 89)),
            ),
             _buildHero(
              context,
              'assets/cars/mers_amg.png',
              "Mersades Bens AMG  ",
              style:
            TextStyle(color: const Color.fromARGB(255, 58, 3, 23)),
            ),
            
          ],
        ),
      ),
    );
  }
}