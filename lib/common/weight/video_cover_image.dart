import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

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

class _VideoCoverImage extends State<VideoCoverImage>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.coverUrl,
      width: widget.width,
      height: widget.height,
      placeholder: (context, url) {
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
      },
      filterQuality: FilterQuality.none,
      fit: BoxFit.cover,
    );
  }
}
