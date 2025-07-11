import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class DiscussionsScreen extends StatelessWidget {
  const DiscussionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Discussions'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            _CategoryTabs(),
            SizedBox(height: AppSpacing.lg),
            Expanded(child: _DiscussionsList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppTheme.accentColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('New Topic'),
      ),
    );
  }
}

class _CategoryTabs extends StatelessWidget {
  const _CategoryTabs();

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'General', 'Academic', 'Projects', 'Jobs'];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: AppSpacing.sm),
            child: FilterChip(
              label: Text(categories[index]),
              selected: isSelected,
              onSelected: (selected) {},
              selectedColor: AppTheme.accentColor.withOpacity(0.2),
              checkmarkColor: AppTheme.accentColor,
            ),
          );
        },
      ),
    );
  }
}

class _DiscussionsList extends StatelessWidget {
  const _DiscussionsList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          child: _DiscussionCard(
            title: 'Help with Data Structures Assignment ${index + 1}',
            content:
                'I\'m having trouble understanding binary trees and their implementation. Can someone explain the concept and provide some examples?',
            author: 'Sarah Johnson',
            timeAgo: '${index + 1}h ago',
            replies: '${(index + 1) * 5}',
            likes: '${(index + 1) * 12}',
            category: ['Academic', 'General', 'Projects'][index % 3],
            isLiked: index % 3 == 0,
            hasNewReplies: index % 4 == 0,
          ),
        );
      },
    );
  }
}

class _DiscussionCard extends StatelessWidget {
  final String title;
  final String content;
  final String author;
  final String timeAgo;
  final String replies;
  final String likes;
  final String category;
  final bool isLiked;
  final bool hasNewReplies;

  const _DiscussionCard({
    required this.title,
    required this.content,
    required this.author,
    required this.timeAgo,
    required this.replies,
    required this.likes,
    required this.category,
    required this.isLiked,
    required this.hasNewReplies,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: AppTheme
            .cardGradients[title.hashCode % AppTheme.cardGradients.length],
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: hasNewReplies
            ? Border.all(color: AppTheme.accentColor.withOpacity(0.3), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                child: Text(
                  author[0].toUpperCase(),
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      author,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: _getCategoryColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: _getCategoryColor(),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),

          // Content
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.sm),

          // Actions
          Row(
            children: [
              _ActionButton(
                icon: isLiked ? Icons.favorite : Icons.favorite_border,
                label: likes,
                color: isLiked ? AppTheme.errorColor : AppTheme.textSecondary,
                onTap: () {},
              ),
              const SizedBox(width: AppSpacing.md),
              _ActionButton(
                icon: Icons.comment_outlined,
                label: replies,
                color: AppTheme.textSecondary,
                onTap: () {},
              ),
              const SizedBox(width: AppSpacing.md),
              _ActionButton(
                icon: Icons.share_outlined,
                label: 'Share',
                color: AppTheme.textSecondary,
                onTap: () {},
              ),
              if (hasNewReplies) ...[
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: const Text(
                    'New replies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor() {
    switch (category) {
      case 'Academic':
        return AppTheme.primaryColor;
      case 'General':
        return AppTheme.accentColor;
      case 'Projects':
        return AppTheme.successColor;
      default:
        return AppTheme.textSecondary;
    }
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
