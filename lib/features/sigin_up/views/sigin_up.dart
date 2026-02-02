import 'package:flutter/material.dart';
import 'package:note_master_pro/core/theme/colors.dart';
import 'package:note_master_pro/features/sigin_up/views/widgets/auth_header.dart';
import 'package:note_master_pro/features/sigin_up/views/widgets/sigin_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const AuthHeader(),
                  const SizedBox(height: 32),
                  const SignUpForm(),
                  const SizedBox(height: 24),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
