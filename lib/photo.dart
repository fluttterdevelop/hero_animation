import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({Key? key, required this.photo, required this.color, required this.onTap}) : super(key: key);
final String photo;
final Color color;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material (
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap:onTap,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return Image.asset(photo,fit: BoxFit.contain,);
          }
        ),
      ),
    );
  }
}