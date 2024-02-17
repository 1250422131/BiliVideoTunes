
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VideoCardGridViewShimmer extends StatelessWidget{
  const VideoCardGridViewShimmer({super.key});


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // 定义列数
      crossAxisCount: 2,
      // 定义列边距
      crossAxisSpacing: 5,
      // 定义行边距
      mainAxisSpacing: 5,
      // 定义内边距
      padding: const EdgeInsets.all(5),
      children: List.generate(
          10,
              (index) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              //<--- 裁剪行为
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                          height: 100,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 10,
                            margin: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }

}