import 'package:flutter/material.dart';
import 'package:note_master_pro/core/theme/colors.dart';

class ViewAllAppBar extends StatelessWidget {
  const ViewAllAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.8),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: const Icon(
              Icons.grid_view_rounded,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'NoteMaster Pro',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: AppColors.avatarGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAI5_t3fNzxpAYy5Xcz_NdD2n0l_b1dKA7u2_Fj9j1yhOyeC7JpefrhRuo_VV-k8mFDFTHhpginK34G_ks_T3sWNKKsjAhiLX1kBdNdzeamoCNKXzdp9VHzK9a8qmclNWG4rVqTn_cL0A7OtP428npNRxJ9o6PmFjoFw_34fDNyOSJYtEelhXWHY08PO9y-f3JBM4LTYWiVGq59_V1IuMio390qLNpXVAkCC8jP3xmcLkTnoy7QMXIFj1uA8cKmJwh2UDlFWWxC23g',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.avatarGradient,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.white,
                      size: 20,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
