import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/recent_activity_card.dart';
import '../widgets/quick_stats.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom App Bar
              const CustomAppBar(),
              const SizedBox(height: AppSpacing.lg),

              // Welcome Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, Priyanshu! 👋',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Ready to learn something new today?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Quick Stats
              const QuickStats(),
              const SizedBox(height: AppSpacing.lg),

              // Quick Actions
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Upload Notes',
                      subtitle: 'Share your study materials',
                      icon: Icons.upload_file,
                      color: AppTheme.primaryColor,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: DashboardCard(
                      title: 'Browse Notes',
                      subtitle: 'Find study materials',
                      icon: Icons.library_books,
                      color: AppTheme.accentColor,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Events',
                      subtitle: 'Check upcoming events',
                      icon: Icons.event,
                      color: AppTheme.successColor,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: DashboardCard(
                      title: 'Discussions',
                      subtitle: 'Join conversations',
                      icon: Icons.forum,
                      color: AppTheme.warningColor,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // Recent Activity
              Text(
                'Recent Activity',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              const RecentActivityCard(
                title: 'Data Structures Notes',
                subtitle: 'uploaded by Sarah Johnson',
                time: '2 hours ago',
                type: 'notes',
              ),
              const SizedBox(height: AppSpacing.sm),
              const RecentActivityCard(
                title: 'Tech Fest 2025',
                subtitle: 'New event posted',
                time: '5 hours ago',
                type: 'event',
              ),
              const SizedBox(height: AppSpacing.sm),
              const RecentActivityCard(
                title: 'Algorithm Discussion',
                subtitle: '12 new replies',
                time: '1 day ago',
                type: 'discussion',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
