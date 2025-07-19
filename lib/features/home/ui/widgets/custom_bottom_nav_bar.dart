import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magicchat/core/resourses/fonts_manager.dart';
import 'package:magicchat/core/resourses/sizes_util_manager.dart';
import 'package:magicchat/core/resourses/styles_manager.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool showLabels;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.showLabels = true, // خليها true لأنها تحسّن تجربة المستخدم
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.people, 'label': 'home.friends'.tr()},
      {'icon': Icons.smart_toy, 'label': 'home.ai_chat'.tr()},
      {'icon': Icons.chat_bubble_outline, 'label': 'home.chat'.tr()},
    ];

    return Container(
      height: showLabels ? HeightManager.h80 : HeightManager.h60,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          final color = isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurfaceVariant;

          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.translucent,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // الخط أعلى الأيقونة، دائماً في الأعلى بدون تباعد
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 4,
                    width: isSelected ? 28 : 0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),

                  SizedBox(height: HeightManager.h8),

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // دائرة خلف الأيقونة للنشيطة
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isSelected ? WidthManager.w40 : 0,
                        height: isSelected ? HeightManager.h40 : 0,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                      ),

                      AnimatedScale(
                        scale: isSelected ? 1.3 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutBack,
                        child: Icon(
                          items[index]['icon'] as IconData,
                          color: color,
                          size: 24,
                        ),
                      ),
                    ],
                  ),

                  if (showLabels) ...[
                    SizedBox(
                        height:
                            isSelected ? HeightManager.h6 : HeightManager.h8),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: isSelected
                          ? getBoldTextStyle(
                              fontSize: IconSizeManager.s14, color: color)
                          : getMediumTextStyle(
                              fontSize: FontSizeManager.s12, color: color),
                      child: Text(items[index]['label'] as String),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
