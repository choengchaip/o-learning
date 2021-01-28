import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  BoxShape shape;

  CacheImage(
      {@required this.image,
      this.height,
      this.width,
      this.margin,
      this.shape}) {
    if (this.shape == null) {
      this.shape = BoxShape.rectangle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.image,
      imageBuilder: (context, imageProvider) => Container(
        margin: this.margin,
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: this.shape,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => Container(
        margin: this.margin,
        height: height,
        width: width,
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        margin: this.margin,
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: this.shape,
          color: Colors.white,
        ),
        child: Icon(Icons.error),
      ),
    );
  }
}
