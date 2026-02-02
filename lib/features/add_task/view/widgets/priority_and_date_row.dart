import 'package:flutter/material.dart';
import 'package:note_master_pro/core/theme/colors.dart';

class PriorityAndDateRow extends StatelessWidget {
  final String? selectedPriority;
  final DateTime? selectedDate;
  final Function(String?) onPriorityChanged;
  final Function(DateTime?) onDateChanged;

  const PriorityAndDateRow({
    super.key,
    this.selectedPriority,
    this.selectedDate,
    required this.onPriorityChanged,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _PriorityDropdown(
                value: selectedPriority,
                onChanged: onPriorityChanged,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _DatePicker(
                selectedDate: selectedDate,
                onDateChanged: onDateChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PriorityDropdown extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;

  const _PriorityDropdown({this.value, required this.onChanged});

  static const List<String> _priorities = ['High', 'Medium', 'Low'];

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return AppColors.statusRed;
      case 'Medium':
        return AppColors.statusYellow;
      case 'Low':
        return AppColors.statusGreen;
      default:
        return AppColors.textMuted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Priority',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: const Text(
                'Select',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              isExpanded: true,
              focusColor: AppColors.textMuted,
              iconSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              dropdownColor: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(14),
              items: _priorities.map((priority) {
                return DropdownMenuItem<String>(
                  value: priority,
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _getPriorityColor(priority),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        priority,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class _DatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime?) onDateChanged;

  const _DatePicker({this.selectedDate, required this.onDateChanged});

  void _openDatePicker(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
            dialogBackgroundColor: AppColors.surface,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Due Date',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _openDatePicker(context),
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedDate != null
                        ? '${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.day.toString().padLeft(2, '0')}/${selectedDate!.year}'
                        : 'mm/dd/yyyy',
                    style: TextStyle(
                      color: selectedDate != null
                          ? AppColors.textPrimary
                          : AppColors.textMuted,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.textMuted,
                  size: 18,
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
