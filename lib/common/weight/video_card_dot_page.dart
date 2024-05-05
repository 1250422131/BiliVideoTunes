import 'dart:math';

import 'package:bili_video_tunes/common/utils/screen_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoCardDotPage extends StatefulWidget {
  final String imageUrl;
  final Offset startPosition;
  final Offset endPosition;

  const VideoCardDotPage({Key? key, required this.imageUrl, required this.startPosition, required this.endPosition}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoCardDotPageState();
}

class _VideoCardDotPageState extends State<VideoCardDotPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller; // 动画 controller
  late Animation<double> _animation; // 动画
  late double left; // 小圆点的left（动态计算）
  late double top; // 小远点的right（动态计算）

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // 显示小圆点的时候动画就开始
    _controller.forward();

  }


  @override
  Widget build(BuildContext context) {


    /// 补间动画
    final offsetAnimation = Tween<Offset>(begin: widget.startPosition, end: widget.endPosition)
        .animate(_controller);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: offsetAnimation.value.dx,
          top: offsetAnimation.value.dy,
          child: Opacity(opacity: 1 - _controller.value,child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              width: 35,
              height: 35,
              placeholder: (context, url) {
                return Container(
                  width: 35,
                  height: 35,
                  color: Colors.grey.shade400,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/app/bili_load.png",
                      width: 35,
                      height: 35,
                    ),
                  ),
                );
              },
              filterQuality: FilterQuality.none,
              fit: BoxFit.cover,
            ),
          ),),
        );
      },
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
