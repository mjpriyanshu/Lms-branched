import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class RecentActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String type;

  const RecentActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: AppTheme
            .cardGradients[type.hashCode % AppTheme.cardGradients.length],
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: _getTypeColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Icon(_getTypeIcon(), color: _getTypeColor(), size: 20),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Text(
            time,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppTheme.textLight),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor() {
    switch (type) {
      case 'notes':
        return AppTheme.primaryColor;
      case 'event':
        return AppTheme.successColor;
      case 'discussion':
        return AppTheme.accentColor;
      default:
        return AppTheme.textSecondary;
    }
  }

  IconData _getTypeIcon() {
    switch (type) {
      case 'notes':
        return Icons.library_books;
      case 'event':
        return Icons.event;
      case 'discussion':
        return Icons.forum;
      default:
        return Icons.info;
    }
  }
}
