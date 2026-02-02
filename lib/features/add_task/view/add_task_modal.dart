import 'package:flutter/material.dart';
import 'package:note_master_pro/core/theme/colors.dart';
import 'package:note_master_pro/features/add_task/view/widgets/attachments_area.dart';
import 'package:note_master_pro/features/add_task/view/widgets/category_selector.dart';
import 'package:note_master_pro/features/add_task/view/widgets/modal_actions.dart';
import 'package:note_master_pro/features/add_task/view/widgets/modal_header.dart';
import 'package:note_master_pro/features/add_task/view/widgets/priority_and_date_row.dart';
import 'package:note_master_pro/features/add_task/view/widgets/task_description_field.dart';
import 'package:note_master_pro/features/add_task/view/widgets/task_title_field.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({super.key});

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedPriority;
  DateTime? _selectedDate;
  int _selectedCategoryIndex = 0;
  final List<String> _attachments = [];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onPriorityChanged(String? value) {
    setState(() => _selectedPriority = value);
  }

  void _onDateChanged(DateTime? date) {
    setState(() => _selectedDate = date);
  }

  void _onCategoryChanged(int index) {
    setState(() => _selectedCategoryIndex = index);
  }

  void _onAttachmentAdded(String path) {
    setState(() => _attachments.add(path));
  }

  void _onSaveTask() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ModalHeader(onClose: () => Navigator.of(context).pop()),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskTitleField(controller: _titleController),
                  const SizedBox(height: 20),
                  TaskDescriptionField(controller: _descriptionController),
                  const SizedBox(height: 20),
                  PriorityAndDateRow(
                    selectedPriority: _selectedPriority,
                    selectedDate: _selectedDate,
                    onPriorityChanged: _onPriorityChanged,
                    onDateChanged: _onDateChanged,
                  ),
                  const SizedBox(height: 20),
                  CategorySelector(
                    selectedIndex: _selectedCategoryIndex,
                    onCategoryChanged: _onCategoryChanged,
                  ),
                  const SizedBox(height: 20),
                  AttachmentsArea(
                    attachments: _attachments,
                    onAttachmentAdded: _onAttachmentAdded,
                  ),
                  const SizedBox(height: 28),
                  ModalActions(
                    onCancel: () => Navigator.of(context).pop(),
                    onSave: _onSaveTask,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
