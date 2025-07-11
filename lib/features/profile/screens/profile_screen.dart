import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppRadius.xl),
                    bottomRight: Radius.circular(AppRadius.xl),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // Profile Image and Info
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      const Text(
                        'Priyanshu MJ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      const Text(
                        'Computer Science • Final Year',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Stats Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _StatColumn(value: '24', label: 'Notes'),
                          _StatColumn(value: '8', label: 'Events'),
                          _StatColumn(value: '156', label: 'Posts'),
                          _StatColumn(value: '89', label: 'Followers'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Menu Items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  children: [
                    _MenuSection(
                      title: 'Academic',
                      items: [
                        _MenuItem(
                          icon: Icons.library_books,
                          title: 'My Notes',
                          subtitle: 'View uploaded notes',
                          onTap: () {},
                        ),
                        _MenuItem(
                          icon: Icons.bookmark,
                          title: 'Saved Notes',
                          subtitle: 'Your bookmarked content',
                          onTap: () {},
                        ),
                        _MenuItem(
                          icon: Icons.event,
                          title: 'My Events',
                          subtitle: 'Events you\'re attending',
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    _MenuSection(
                      title: 'Community',
                      items: [
                        _MenuItem(
                          icon: Icons.forum,
                          title: 'My Discussions',
                          subtitle: 'Your topics and replies',
                          onTap: () {},
                        ),
                        _MenuItem(
                          icon: Icons.people,
                          title: 'Following',
                          subtitle: 'People you follow',
                          onTap: () {},
                        ),
                        _MenuItem(
                          icon: Icons.star,
                          title: 'Achievements',
                          subtitle: 'Your badges and rewards',
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    _MenuSection(
                      title: 'Settings',
                      items: [
                        _MenuItem(
                          icon: Icons.notifications,
                          title: 'Notifications',
                          subtitle: 'Manage notifications',
                          onTap: () {},
                        ),
                        _MenuItem(
                          icon: Icons.privacy_tip,
                          title: 'Privacy',
                          subtitle: 'Privacy settings',
                          onTap: () {},
                        ),
                        _MenuItem(
                          icon: Icons.help,
                          title: 'Help & Support',
                          subtitle: 'Get help and support',
                          onTap: () {},
                        ),
                        _MenuItem(
                          icon: Icons.logout,
                          title: 'Logout',
                          subtitle: 'Sign out of your account',
                          onTap: () {},
                          isDestructive: true,
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.xxl),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const _StatColumn({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}

class _MenuSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _MenuSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSpacing.sm),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          decoration: BoxDecoration(
            gradient: AppTheme
                .cardGradients[title.hashCode % AppTheme.cardGradients.length],
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(children: items.map((item) => item).toList()),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: 4,
      ),
      leading: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: isDestructive
              ? AppTheme.errorColor.withOpacity(0.1)
              : AppTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        child: Icon(
          icon,
          color: isDestructive ? AppTheme.errorColor : AppTheme.primaryColor,
          size: 18,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: isDestructive ? AppTheme.errorColor : AppTheme.textPrimary,
        ),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppTheme.textLight,
        size: 16,
      ),
      onTap: onTap,
    );
  }
}
