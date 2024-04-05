import 'package:flutter/cupertino.dart';

class AssembleAutoAnimatedOpacity extends StatefulWidget {
  final Widget? child;
  final bool alwaysIncludeSemantics;
  final Duration duration;

  const AssembleAutoAnimatedOpacity(
      {super.key,
      this.child,
      required this.duration,
      this.alwaysIncludeSemantics = false});

  @override
  State<StatefulWidget> createState() => _AssembleAutoAnimatedOpacity();
}

class _AssembleAutoAnimatedOpacity extends State<AssembleAutoAnimatedOpacity> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      alwaysIncludeSemantics: widget.alwaysIncludeSemantics,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
