import 'package:flutter/material.dart';

class TaskData {
  final String title;
  final String description;
  final TaskPriority priority;
  final String category;
  final Color categoryColor;
  final String dueDate;
  final Color priorityColor;
  final bool isCompleted;

  TaskData({
    required this.title,
    required this.description,
    required this.priority,
    required this.category,
    required this.categoryColor,
    required this.dueDate,
    required this.priorityColor,
    this.isCompleted = false,
  });
}

enum TaskPriority { high, normal, low }
