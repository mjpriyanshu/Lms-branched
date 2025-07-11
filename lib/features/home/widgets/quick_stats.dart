import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class QuickStats extends StatelessWidget {
  const QuickStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            value: '24',
            label: 'Notes Shared',
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _StatCard(
            value: '8',
            label: 'Events Joined',
            color: AppTheme.accentColor,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _StatCard(
            value: '156',
            label: 'Discussions',
            color: AppTheme.successColor,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Increased height slightly
      padding: const EdgeInsets.all(AppSpacing.sm), // Reduced padding
      decoration: BoxDecoration(
        gradient: AppTheme
            .cardGradients[color.hashCode % AppTheme.cardGradients.length],
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              // Changed from headlineMedium
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4), // Fixed small spacing
          Flexible(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
