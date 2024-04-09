import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchSquareListShimmer extends StatelessWidget {
  const SearchSquareListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 2,
      ),
      children: List.generate(
          10,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child:  Container(
              width: 40,
              height: 10,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
          )),
    );
  }
}
