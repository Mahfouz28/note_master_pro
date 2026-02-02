import 'package:flutter/material.dart';
import 'package:note_master_pro/core/components/glass_card.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

/// Task item widget for displaying individual tasks
class TaskItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color indicatorColor;
  final VoidCallback? onTap;
  final bool isCompleted;
  final ValueChanged<bool>? onCheckChanged;

  const TaskItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.indicatorColor,
    this.onTap,
    this.isCompleted = false,
    this.onCheckChanged,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GlassCard(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        borderColor: _isHovered ? AppColors.borderLight : AppColors.border,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Checkbox
              GestureDetector(
                onTap: () {
                  if (widget.onCheckChanged != null) {
                    widget.onCheckChanged!(!widget.isCompleted);
                  }
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.glassMedium,
                    border: Border.all(
                      color: _isHovered
                          ? AppColors.purple
                          : AppColors.textMuted,
                      width: 1.5,
                    ),
                  ),
                  child: widget.isCompleted
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: _isHovered
                              ? AppColors.purple
                              : AppColors.textPrimary,
                        )
                      : _isHovered
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.purple.withOpacity(0.5),
                        )
                      : null,
                ),
              ),

              const SizedBox(width: 16),

              // Title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppTypography.taskTitle.copyWith(
                        color: _isHovered
                            ? AppColors.purpleLight
                            : AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.subtitle,
                      style: AppTypography.taskSubtitle.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Status indicator dot
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.indicatorColor,
                  boxShadow: [
                    BoxShadow(
                      color: widget.indicatorColor.withOpacity(0.6),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
