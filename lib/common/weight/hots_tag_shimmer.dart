import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HotsTagShimmerWrap extends StatelessWidget {
  final int mockNum;
  final int spacing;

  const HotsTagShimmerWrap(
      {required this.mockNum, required this.spacing, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        children: List.generate(
            5,
            (index) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child:
                      const ChoiceChip(label: Text("XXXXX"), selected: false),
                )));
  }
}
