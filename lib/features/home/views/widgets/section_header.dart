import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

/// Section header widget with title and optional action button
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.sectionHeader.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        if (trailing != null)
          trailing!
        else if (actionText != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionText!,
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.purple,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
