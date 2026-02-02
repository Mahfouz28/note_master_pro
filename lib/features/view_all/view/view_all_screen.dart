import 'package:flutter/material.dart';
import 'package:note_master_pro/core/theme/colors.dart';
import 'package:note_master_pro/features/view_all/model/task_model.dart';
import 'package:note_master_pro/features/view_all/view/fabBotton.dart';
import 'package:note_master_pro/features/view_all/view/widgets/app_bar.dart';
import 'package:note_master_pro/features/view_all/view/widgets/task_section.dart';
import 'package:note_master_pro/core/components/serarsh_bar.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              const ViewAllAppBar(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomSearchBar(
                  controller: _searchController,
                  onChanged: (value) {},
                  onFilterTap: () {},
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    TaskSection(
                      title: 'HIGH PRIORITY',
                      taskCount: 2,
                      tasks: _getHighPriorityTasks(),
                    ),
                    const SizedBox(height: 24),
                    TaskSection(title: 'UPCOMING', tasks: _getUpcomingTasks()),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FabButton(),
    );
  }

  List<TaskData> _getHighPriorityTasks() {
    return [
      TaskData(
        title: 'Review Q3 Financial Reports',
        description:
            'Analyze profit margins and prepare slides for the board meeting scheduled for...',
        priority: TaskPriority.high,
        category: 'Finance',
        categoryColor: AppColors.statusBlue,
        dueDate: 'Today, 2:00 PM',
        priorityColor: AppColors.statusRed,
      ),
      TaskData(
        title: 'Server Migration',
        description:
            'Coordinate downtime with the team and ensure backups are verified before...',
        priority: TaskPriority.high,
        category: 'DevOps',
        categoryColor: AppColors.purple,
        dueDate: 'Oct 12, 10:00 AM',
        priorityColor: AppColors.statusRed,
      ),
    ];
  }

  List<TaskData> _getUpcomingTasks() {
    return [
      TaskData(
        title: 'Team Sync: Project Alpha',
        description:
            'Discuss milestone progress and blockers with the dev team...',
        priority: TaskPriority.low,
        category: 'Product',
        categoryColor: Color(0xFFFF9800),
        dueDate: 'Tomorrow, 9:00 AM',
        priorityColor: AppColors.statusGreen,
      ),
      TaskData(
        title: 'Update Client Contacts',
        description:
            'Verify email addresses for the upcoming newsletter blast...',
        priority: TaskPriority.normal,
        category: 'Marketing',
        categoryColor: Color(0xFFEC4899),
        dueDate: 'Nov 02, 11:30 AM',
        priorityColor: AppColors.primary,
      ),
    ];
  }
}
