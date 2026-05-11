import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerCard({super.key, this.width = 140, this.height = 200});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? const Color(0xFF2A2A3E) : const Color(0xFFE8EAFF);
    final highlightColor = isDark ? const Color(0xFF3A3A5E) : Colors.white;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: width * 0.9,
            height: 12,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: width * 0.55,
            height: 10,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  final int count;
  final double cardWidth;
  final double cardHeight;

  const ShimmerList({
    super.key,
    this.count = 5,
    this.cardWidth = 140,
    this.cardHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight + 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, __) => ShimmerCard(width: cardWidth, height: cardHeight),
      ),
    );
  }
}
