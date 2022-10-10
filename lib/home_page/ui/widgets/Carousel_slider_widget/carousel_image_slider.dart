import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../response/homepage_response.dart';
class CarouselImageSlider extends StatefulWidget {
  final HomePageModel homepage;
  final itemIndex;
  CarouselImageSlider({required this.homepage,this.itemIndex});

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            CachedNetworkImage(
              // cacheManager: customCacheManager,
              // maxHeightDiskCache: 100,
              key: UniqueKey(),
              imageUrl: widget.homepage
                  .ads[widget.itemIndex].image
                  .toString(),
              imageBuilder: (context, imageProvider) =>
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: LoadingAnimationWidget.inkDrop(
                    color: Theme.of(context).primaryColor,
                    size: 20),
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
