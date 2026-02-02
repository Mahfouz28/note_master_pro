import 'package:flutter/material.dart';
import 'package:note_master_pro/core/theme/colors.dart';

class CategoryData {
  final String label;
  final IconData icon;
  final Color color;

  const CategoryData({
    required this.label,
    required this.icon,
    required this.color,
  });
}

class CategorySelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onCategoryChanged;

  const CategorySelector({
    super.key,
    required this.selectedIndex,
    required this.onCategoryChanged,
  });

  static const List<CategoryData> _categories = [
    CategoryData(
      label: 'Work',
      icon: Icons.work_outline,
      color: AppColors.primary,
    ),
    CategoryData(
      label: 'Personal',
      icon: Icons.person_outline,
      color: AppColors.textSecondary,
    ),
    CategoryData(
      label: 'Study',
      icon: Icons.school_outlined,
      color: AppColors.textSecondary,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ..._categories.mapIndexed((index, category) {
              final isSelected = index == selectedIndex;
              return _CategoryChip(
                label: category.label,
                icon: category.icon,
                isSelected: isSelected,
                onTap: () => onCategoryChanged(index),
              );
            }),
            _AddCategoryButton(),
          ],
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? AppColors.white : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.white : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddCategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: const Icon(Icons.add, size: 18, color: AppColors.textMuted),
      ),
    );
  }
}

extension _ListIndexed<T> on List<T> {
  Iterable<Widget> mapIndexed(Widget Function(int index, T item) f) {
    return asMap().entries.map((entry) => f(entry.key, entry.value));
  }
}
