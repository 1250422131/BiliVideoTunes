import 'package:flutter/material.dart';

class SingleLineLyric extends StatefulWidget {
  final ThemeData themeData;
  final String lyric;
  final int totalTime;
  final AnimationController? animationController;

  const SingleLineLyric({
    Key? key,
    required this.lyric,
    required this.totalTime,
    required this.themeData,
    this.animationController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SingleLineLyric();
}

class _SingleLineLyric extends State<SingleLineLyric>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    widget.animationController?.duration =
        Duration(milliseconds: widget.totalTime);

    _controller = widget.animationController ??
        AnimationController(
          duration: Duration(seconds: widget.totalTime),
          vsync: this,
        );

    _animation = Tween<double>(
      begin: 0,
      end: 0, // 使用 0 到 1 的范围
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SingleLineLyric oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.lyric != oldWidget.lyric) {
      _controller.duration = Duration(seconds: widget.totalTime);
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            _animation = Tween<double>(
              begin: 0,
              end: bounds.width * 2,
            ).animate(_controller);
            return LinearGradient(
              colors: [
                widget.themeData.colorScheme.onPrimaryContainer,
                widget.themeData.colorScheme.onPrimaryContainer.withOpacity(0.5),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(Rect.fromLTWH(_animation.value - bounds.width, 0,
                bounds.width, bounds.height));
          },
          child: Text(
            widget.lyric,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
          ),
        );
      },
    );
  }
}
