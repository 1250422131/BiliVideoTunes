import 'package:flutter/material.dart';

class VideoCoverImage extends StatefulWidget {
  final double? width;
  final double? height;
  final String coverUrl;

  const VideoCoverImage(
      {Key? key, required this.coverUrl, this.width, this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoCoverImage();
}

class _VideoCoverImage extends State<VideoCoverImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.coverUrl,
      width: widget.width,
      height: widget.height,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Container(
            width: widget.width,
            height: widget.height,
            color: Colors.grey.shade400,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/app/bili_load.png",
                width: 50,
                height: 50,
              ),
            ),
          );
        }
      },
      filterQuality: FilterQuality.none,
      fit: BoxFit.cover,
    );
  }
}
