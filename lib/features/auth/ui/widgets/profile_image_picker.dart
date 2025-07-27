import 'dart:io';

import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const ProfileImagePicker({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: HeightManager.h60,
        backgroundColor: Colors.deepPurple.shade50,
        backgroundImage: image != null ? FileImage(image!) : null,
        child: image == null
            ? Icon(Icons.camera_alt, size: 40, color: Colors.deepPurple)
            : null,
      ),
    );
  }
}
