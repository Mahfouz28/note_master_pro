import 'package:flutter/material.dart';
import 'package:note_master_pro/core/theme/colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppColors.darkblueGlow,
          ),
          child: const Icon(
            Icons.note_alt_rounded,
            size: 40,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'NoteMaster Pro',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Organize your tasks efficiently',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
