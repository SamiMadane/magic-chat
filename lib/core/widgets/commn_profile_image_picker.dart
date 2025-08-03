import 'dart:io';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/custom_shimmer_theme.dart';
import 'package:shimmer/shimmer.dart';

class CommonProfileImagePicker extends StatelessWidget {
  final File? image;
  final String? imageUrl;
  final String? username;
  final VoidCallback onTap;
  final double radius;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final bool editIconOnlyTap;

  const CommonProfileImagePicker({
    super.key,
    required this.image,
    required this.onTap,
    this.imageUrl,
    this.username,
    this.radius = 60,
    this.backgroundColor = const Color(0xFFF3E5F5),
    this.icon = Icons.camera_alt,
    this.iconColor = const Color(0xFF673AB7),
    this.iconSize = 40,
    this.editIconOnlyTap = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget avatar;

    if (image != null) {
      avatar = CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        backgroundImage: FileImage(image!),
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatar = CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            width: radius * 2,
            height: radius * 2,
            fit: BoxFit.cover,
            placeholder: (context, url) => _buildShimmer(context),
            errorWidget: (context, url, error) =>
                _buildFallbackAvatar(username),
          ),
        ),
      );
    } else {
      avatar = _buildFallbackAvatar(username);
    }

    if (editIconOnlyTap) {
      return Stack(
        children: [
          avatar,
          Positioned(
            bottom: 4,
            right: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: radius / 3.5,
                  backgroundColor: colorScheme.onPrimary,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: radius / 4,
                    backgroundColor: colorScheme.primary,
                    child: Icon(
                      Icons.edit,
                      color: colorScheme.onPrimary,
                      size: radius / 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: avatar,
      );
    }
  }

  Widget _buildShimmer(BuildContext context) {
    final shimmerTheme = Theme.of(context).extension<CustomShimmerTheme>()!;
    return Shimmer.fromColors(
      baseColor: shimmerTheme.baseColor,
      highlightColor: shimmerTheme.highlightColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: shimmerTheme.baseColor,
      ),
    );
  }

  Widget _buildFallbackAvatar(String? username) {
     final color = username == null
      ? const Color(0xFF9E9E9E) // لون ثابت للكاميرا
      : _getRandomColor(username);

    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: username == null
          ? Icon(
              Icons.camera_alt,
              size: radius * 0.7,
              color: Colors.white,
            )
          : Text(
              username.trim()[0].toUpperCase(),
              style: TextStyle(
                fontSize: radius * 0.7,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

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
}
