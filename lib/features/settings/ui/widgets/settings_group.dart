import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

class SettingsGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsGroup({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: HeightManager.h10),
          child: Text(title,
              style: getSemiBoldTextStyle(
                  fontSize: FontSizeManager.s14,
                  color: Theme.of(context).colorScheme.primary)),
        ),
        Card(
          child: Column(children: children),
        ),
        SizedBox(height: HeightManager.h24),
      ],
    );
  }
}
