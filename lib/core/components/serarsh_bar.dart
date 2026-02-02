import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

class CustomSearchBar extends StatefulWidget {
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.placeholder = 'Search tasks, categories, or tags...',
    this.onChanged,
    this.onFilterTap,
    this.controller,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.glassMedium,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? AppColors.white
                  : AppColors.borderDark,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Search icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.search,
                  color: _focusNode.hasFocus
                      ? AppColors.textMuted
                      : AppColors.textSecondary,
                  size: 24,
                ),
              ),

              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  onChanged: widget.onChanged,

                  decoration: InputDecoration(
                    filled: false,
                    hintText: widget.placeholder,
                    hintStyle: AppTypography.inputPlaceholder.copyWith(
                      color: AppColors.textSecondary.withOpacity(0.7),
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),

              if (widget.onFilterTap != null)
                IconButton(
                  onPressed: widget.onFilterTap,
                  icon: const Icon(Icons.tune),
                  color: AppColors.textMuted,
                  iconSize: 20,
                  splashRadius: 20,
                ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}
