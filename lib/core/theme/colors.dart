import 'package:flutter/material.dart';

/// Application-wide color constants for NoteMaster Pro
/// Dark premium glassmorphic theme
class AppColors {
  AppColors._(); // private constructor - utility class

  // =============================================
  // Core Dark Background & Surface
  // =============================================
  static const Color background = Color(0xFF101922); // main scaffold bg
  static const Color backgroundDark = Color(0xFF0F1720); // deeper variant
  static const Color surface = Color(0xFF1A2633); // card/form container
  static const Color surfaceElevated = Color(0xFF1E293B); // elevated surfaces

  // Glassmorphic surfaces
  static const Color glassLight = Color(
    0x14FFFFFF,
  ); // rgba(255, 255, 255, 0.08)
  static const Color glassMedium = Color(
    0x0DFFFFFF,
  ); // rgba(255, 255, 255, 0.05)
  static const Color glassDark = Color(0x05FFFFFF); // rgba(255, 255, 255, 0.02)

  // =============================================
  // Primary Accent Colors
  // =============================================
  static const Color primary = Color(0xFF0D7FF2); // primary blue
  static const Color primaryLight = Color(0xFF3B82F6); // lighter blue
  static const Color primaryDark = Color(0xFF0A5FBF); // darker blue

  // Purple accent (FAB, highlights, links)
  static const Color purple = Color(0xFFD946EF); // neon purple/magenta
  static const Color purpleLight = Color(0xFFA855F7); // lighter purple
  static const Color purpleDark = Color(0xFF9333EA); // darker purple

  // =============================================
  // Semantic Status Colors
  // =============================================
  // Blue - Total Tasks
  static const Color statusBlue = Color(0xFF3B82F6);
  static const Color statusBlueBackground = Color(0x333B82F6); // 20% opacity

  // Yellow - Pending
  static const Color statusYellow = Color(0xFFFACC15);
  static const Color statusYellowBackground = Color(0x33FACC15); // 20% opacity

  // Red - High Priority
  static const Color statusRed = Color(0xFFEF4444);
  static const Color statusRedBackground = Color(0x33EF4444); // 20% opacity

  // Green - Completed
  static const Color statusGreen = Color(0xFF10B981);
  static const Color statusGreenBackground = Color(0x3310B981); // 20% opacity

  // Additional semantic colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // =============================================
  // Text Colors
  // =============================================
  static const Color textPrimary = Color(0xFFFFFFFF); // main titles
  static const Color textSecondary = Color(
    0xFF94A3B8,
  ); // subtitles, labels (slate-400)
  static const Color textMuted = Color(0xFF64748B); // helper text (slate-500)
  static const Color textDisabled = Color(
    0xFF475569,
  ); // disabled text (slate-600)

  // =============================================
  // Border & Divider Colors
  // =============================================
  static const Color border = Color(0x14FFFFFF); // rgba(255, 255, 255, 0.08)
  static const Color borderLight = Color(
    0x1AFFFFFF,
  ); // rgba(255, 255, 255, 0.1)
  static const Color borderDark = Color(
    0x0DFFFFFF,
  ); // rgba(255, 255, 255, 0.05)
  static const Color divider = Color(0x0DFFFFFF);

  // =============================================
  // Gradient Definitions
  // =============================================
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0F1720), Color(0xFF101922), Color(0xFF0F1720)],
  );

  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x14FFFFFF), // rgba(255, 255, 255, 0.08)
      Color(0x05FFFFFF), // rgba(255, 255, 255, 0.02)
    ],
  );

  static const LinearGradient purpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFD946EF), // magenta
      Color(0xFFA855F7), // purple
    ],
  );

  static const LinearGradient avatarGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6366F1), // indigo-500
      Color(0xFFA855F7), // purple-500
      Color(0xFFEC4899), // pink-500
    ],
  );

  // =============================================
  // Shadow & Glow Effects
  // =============================================
  static List<BoxShadow> glassCardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 20,
      offset: const Offset(0, 4),
      spreadRadius: -2,
    ),
  ];

  static List<BoxShadow> purpleGlow = [
    BoxShadow(
      color: const Color(0xFFD946EF).withOpacity(0.5),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> redGlow = [
    BoxShadow(color: const Color(0xFFF87171).withOpacity(0.6), blurRadius: 8),
  ];

  static List<BoxShadow> yellowGlow = [
    BoxShadow(color: const Color(0xFFFACC15).withOpacity(0.6), blurRadius: 8),
  ];

  static List<BoxShadow> blueGlow = [
    BoxShadow(color: const Color(0xFF60A5FA).withOpacity(0.6), blurRadius: 8),
  ];

  // =============================================
  // Utility Colors
  // =============================================
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  // Online status indicator
  static const Color onlineGreen = Color(0xFF10B981);

  // Selection color
  static const Color selection = Color(0xFFA855F7);
}
