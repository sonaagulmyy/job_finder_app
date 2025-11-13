import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class JobCardSkeleton extends StatelessWidget {
  final double width;
  const JobCardSkeleton({super.key,required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CupertinoColors.systemGrey5,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CupertinoColors.systemGrey5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}