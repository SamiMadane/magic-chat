import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/custom_shimmer_theme.dart';
import 'package:shimmer/shimmer.dart';

class CommonProfileImagePicker extends StatelessWidget {
  final File? image;
  final String? imageUrl;
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
      // صورة من الملف (File)
      avatar = CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        backgroundImage: FileImage(image!),
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      // صورة من الإنترنت (Cached + Shimmer)
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
            errorWidget: (context, url, error) => Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      );
    } else {
      // لا صورة، عرض أيقونة فقط
      avatar = CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: Icon(icon, size: iconSize, color: iconColor),
      );
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
}
