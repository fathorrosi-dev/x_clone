import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:x_clone/bloc/auth_bloc.dart';
import 'package:x_clone/bloc/tweet_bloc.dart';
import 'package:x_clone/core/core.dart';
import 'package:x_clone/models/tweet_model.dart';

class TweetCard extends StatelessWidget {
  final TweetModel tweet;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const TweetCard({super.key, required this.tweet, this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final currentUserId = authState is Authenticated
        ? authState.user.uid
        : null;
    final isOwner = currentUserId == tweet.userId;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: context.colorScheme.outline),
          ),
        ),
        padding: EdgeInsets.all(context.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: context.colorScheme.primary,
                  child: Text(
                    tweet.userDisplayName?[0].toUpperCase() ?? '?',
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(width: context.space12),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        tweet.userDisplayName ?? 'Anonymous',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: context.space8),
                      Text(
                        timeago.format(tweet.createdAt),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      if (isOwner) ...[
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => SafeArea(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.delete_outline),
                                      title: const Text('Delete Tweet'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        onDelete?.call();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: context.space4),
            Text(tweet.tweetContent),
            SizedBox(height: context.space12),
            Row(
              children: [
                _TweetActionButton(
                  icon: Icons.favorite_border,
                  activeIcon: Icons.favorite,
                  count: tweet.likesCount,
                  onTap: currentUserId == null
                      ? null
                      : () {
                          context.read<TweetBloc>().add(
                            TweetEvent.likeTweet(
                              tweetId: tweet.tweetId,
                              userId: currentUserId,
                            ),
                          );
                        },
                ),
                SizedBox(width: context.space16),
                _TweetActionButton(
                  icon: Icons.chat_bubble_outline,
                  activeIcon: Icons.chat_bubble,
                  count: tweet.commentsCount,
                  onTap: () {
                    // TODO: Implement comments
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TweetActionButton extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final int count;
  final VoidCallback? onTap;

  const _TweetActionButton({
    required this.icon,
    required this.activeIcon,
    required this.count,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Row(
        children: [
          Icon(
            count > 0 ? activeIcon : icon,
            size: 20,
            color: count > 0
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
          ),
          if (count > 0) ...[
            SizedBox(width: context.space4),
            Text(count.toString(), style: context.textTheme.bodySmall),
          ],
        ],
      ),
    );
  }
}
