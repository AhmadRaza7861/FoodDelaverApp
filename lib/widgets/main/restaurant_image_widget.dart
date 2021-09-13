import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RestaurentImageWidget extends StatelessWidget {
  final String imageUrl;
  const RestaurentImageWidget({Key? key,required this.imageUrl}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 250,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(imageUrl:imageUrl ,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.image),
        ),
      ),
    );
  }
}
