import 'package:flutter/material.dart';
import 'package:note_master_pro/core/theme/colors.dart';

class AttachmentsArea extends StatelessWidget {
  final List<String> attachments;
  final Function(String) onAttachmentAdded;

  const AttachmentsArea({
    super.key,
    required this.attachments,
    required this.onAttachmentAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Attachments',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        attachments.isEmpty
            ? _DropZone(onTap: () {})
            : Column(
                children: [
                  ...attachments.map((file) => _AttachmentItem(fileName: file)),
                  const SizedBox(height: 10),
                  _DropZone(onTap: () {}, isCompact: true),
                ],
              ),
      ],
    );
  }
}

class _DropZone extends StatelessWidget {
  final VoidCallback onTap;
  final bool isCompact;

  const _DropZone({required this.onTap, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: isCompact ? 56 : 100,
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.border,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.upload_outlined,
              size: isCompact ? 20 : 28,
              color: AppColors.textMuted,
            ),
            if (!isCompact) ...[
              const SizedBox(height: 8),
              const Text(
                'Tap or Drop files here',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AttachmentItem extends StatelessWidget {
  final String fileName;

  const _AttachmentItem({required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.insert_drive_file_outlined,
              size: 18,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              fileName,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close_rounded,
              size: 18,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
