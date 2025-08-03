import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/custom_shimmer_theme.dart';
import 'package:shimmer/shimmer.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? username;
  final double radius;

  const ProfileAvatar({
    Key? key,
    this.imageUrl,
    this.username,
    this.radius = 40,
  }) : super(key: key);

  Color _getRandomColor(String input) {
    final hash = input.hashCode;
    final rng = Random(hash);
    return Color.fromARGB(
      255,
      100 + rng.nextInt(155),
      100 + rng.nextInt(155),
      100 + rng.nextInt(155),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    final firstLetter = (username?.isNotEmpty == true)
        ? username!.trim()[0].toUpperCase()
        : '?';

    return CircleAvatar(
      radius: radius,
      backgroundColor:
          hasImage ? Colors.transparent : _getRandomColor(username ?? ''),
      child: hasImage
          ? ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    _buildShimmerLoading(context, radius),
                errorWidget: (context, url, error) => _buildLetter(firstLetter),
              ),
            )
          : _buildLetter(firstLetter),
    );
  }

  Widget _buildLetter(String letter) {
    return Center(
      child: Text(
        letter,
        style: TextStyle(
          fontSize: radius * 0.7,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildShimmerLoading(BuildContext context, double radius) {
    final shimmerTheme = Theme.of(context).extension<CustomShimmerTheme>()!;
    return Shimmer.fromColors(
      baseColor: shimmerTheme.baseColor,
      highlightColor: shimmerTheme.highlightColor,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: shimmerTheme.baseColor,
        ),
      ),
    );
  }
}
