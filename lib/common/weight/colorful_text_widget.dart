import 'package:flutter/material.dart';

class ColorfulTextWidget extends StatefulWidget {
  final String text;
  final Duration duration;
  final bool shouldStartAnimation; // 这里添加了一个用于控制动画开始的布尔值



  const ColorfulTextWidget({super.key,
    required this.text,
    required this.duration,
    this.shouldStartAnimation = false,
  });

  @override
  createState() => _ColorfulTextWidgetState();
}

class _ColorfulTextWidgetState extends State<ColorfulTextWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;



  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // 如果条件满足，开始动画
    if (widget.shouldStartAnimation) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(ColorfulTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 当条件变为true时，启动动画
    if (widget.shouldStartAnimation && !oldWidget.shouldStartAnimation) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return RichText(
          textAlign:TextAlign.center ,
          text: TextSpan(
            children: _buildTextSpans(),
            style: DefaultTextStyle.of(context).style,
          ),
        );
      },
    );
  }

  List<TextSpan> _buildTextSpans() {
    // 上色进度，_controller.value是一个0-1变动的值，这个值乘以总数目，就可以获得需要上色的字数
    int coloredCharCount = (_controller.value * widget.text.length).round();
    List<TextSpan> spans = [];

    for (int i = 0; i < widget.text.length; i++) {

      final color = i < coloredCharCount && widget.shouldStartAnimation ? Colors.blue : Colors.black;
      spans.add(TextSpan(text: widget.text[i], style: TextStyle(color: color,fontSize: 16)));

    }

    return spans;
  }
}
