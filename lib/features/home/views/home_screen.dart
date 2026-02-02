import 'package:flutter/material.dart';
import 'package:note_master_pro/core/components/serarsh_bar.dart';
import 'package:note_master_pro/features/home/views/widgets/stuts_card.dart';
import '../../../core/theme/colors.dart';
import 'widgets/glass_app_bar.dart';
import 'widgets/task_item.dart';
import 'widgets/section_header.dart';

/// Home screen displaying task overview and recent tasks
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: false,

      appBar: GlassAppBar(
        userName: 'User',
        avatarInitials: 'JD',
        onMenuTap: () {},
        onAvatarTap: () {},
      ),

      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        elevation: 0,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            gradient: AppColors.purpleGradient,
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppColors.white.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: AppColors.purpleGlow,
          ),
          child: const Icon(Icons.add, size: 32, color: AppColors.textPrimary),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchBar(
                    controller: _searchController,
                    onChanged: (value) {},
                    onFilterTap: () {},
                  ),

                  const SizedBox(height: 32),

                  // Overview section
                  SectionHeader(
                    title: 'Overview',
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.glassMedium,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.borderDark,
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        'Updated now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Stats grid
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.05,
                    children: const [
                      StatsCard(
                        icon: Icons.list_alt,
                        iconColor: AppColors.statusBlue,
                        iconBackgroundColor: AppColors.statusBlueBackground,
                        value: '24',
                        label: 'Total Tasks',
                        glowColor: AppColors.statusBlue,
                      ),
                      StatsCard(
                        icon: Icons.schedule,
                        iconColor: AppColors.statusYellow,
                        iconBackgroundColor: AppColors.statusYellowBackground,
                        value: '12',
                        label: 'Pending',
                        glowColor: AppColors.statusYellow,
                      ),
                      StatsCard(
                        icon: Icons.priority_high,
                        iconColor: AppColors.statusRed,
                        iconBackgroundColor: AppColors.statusRedBackground,
                        value: '5',
                        label: 'High Priority',
                        glowColor: AppColors.statusRed,
                      ),
                      StatsCard(
                        icon: Icons.check_circle,
                        iconColor: AppColors.statusGreen,
                        iconBackgroundColor: AppColors.statusGreenBackground,
                        value: '7',
                        label: 'Completed',
                        glowColor: AppColors.statusGreen,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Recent Tasks section
                  SectionHeader(
                    title: 'Recent Tasks',
                    actionText: 'View All',
                    onActionTap: () {},
                  ),

                  const SizedBox(height: 16),

                  // Task list
                  TaskItem(
                    title: 'Website Redesign',
                    subtitle: 'Design Team • Today, 2:00 PM',
                    indicatorColor: AppColors.statusRed,
                    onTap: () {},
                    onCheckChanged: (value) {},
                  ),

                  const SizedBox(height: 12),

                  TaskItem(
                    title: 'Quarterly Report',
                    subtitle: 'Finance • Tomorrow',
                    indicatorColor: AppColors.statusYellow,
                    onTap: () {},
                    onCheckChanged: (value) {},
                  ),

                  const SizedBox(height: 12),

                  TaskItem(
                    title: 'Client Onboarding',
                    subtitle: 'Sales • Oct 24',
                    indicatorColor: AppColors.statusBlue,
                    onTap: () {},
                    onCheckChanged: (value) {},
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [AppColors.backgroundDark, AppColors.transparent],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
