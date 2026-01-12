import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/bloc/auth_bloc.dart';
import 'package:x_clone/bloc/tweet_bloc.dart';
import 'package:x_clone/core/core.dart';
import 'package:x_clone/models/tweet_model.dart';
import 'package:x_clone/ui/tweet/components/tweet_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    if (authState is! Authenticated) {
      return const Center(child: Text('Please login to view profile'));
    }

    final user = authState.user;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: Column(
          children: [
            // User Profile Section
            Container(
              padding: EdgeInsets.all(context.space16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: context.colorScheme.primary,
                        child: Text(
                          user.displayName?[0].toUpperCase() ?? '?',
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      SizedBox(width: context.space16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.displayName ?? 'Anonymous',
                              style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: context.space4),
                            Text(
                              user.email,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.space16),
                  // Tab Bar
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Tweets'),
                Tab(text: 'Likes'),
                Tab(text: 'Replies'),
              ],
            ),
            SizedBox(height: context.space16),
            // Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _TweetsTab(userId: user.uid),
                  _LikesTab(userId: user.uid),
                  const _RepliesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TweetsTab extends StatelessWidget {
  final String userId;

  const _TweetsTab({required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TweetBloc, TweetState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<TweetBloc>().add(
              TweetEvent.loadUserTweets(userId: userId),
            );
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tweets) => _buildTweetList(context, tweets),
          error: (message) => Center(child: Text(message)),
          success: (message) => const SizedBox(),
        );
      },
    );
  }

  Widget _buildTweetList(BuildContext context, List<TweetModel> tweets) {
    if (tweets.isEmpty) {
      return const Center(child: Text('No tweets yet'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<TweetBloc>().add(
          TweetEvent.loadUserTweets(userId: userId),
        );
      },
      child: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          final tweet = tweets[index];
          return TweetCard(
            tweet: tweet,
            onDelete: () {
              context.read<TweetBloc>().add(
                TweetEvent.deleteTweet(tweetId: tweet.tweetId),
              );
            },
          );
        },
      ),
    );
  }
}

class _LikesTab extends StatelessWidget {
  final String userId;

  const _LikesTab({required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TweetBloc, TweetState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<TweetBloc>().add(
              TweetEvent.loadLikedTweets(userId: userId),
            );
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (tweets) => _buildTweetList(context, tweets),
          error: (message) => Center(child: Text(message)),
          success: (message) => const SizedBox(),
        );
      },
    );
  }

  Widget _buildTweetList(BuildContext context, List<TweetModel> tweets) {
    if (tweets.isEmpty) {
      return const Center(child: Text('No liked tweets'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<TweetBloc>().add(
          TweetEvent.loadLikedTweets(userId: userId),
        );
      },
      child: ListView.separated(
        itemCount: tweets.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => TweetCard(tweet: tweets[index]),
      ),
    );
  }
}

class _RepliesTab extends StatelessWidget {
  const _RepliesTab();

  @override
  Widget build(BuildContext context) {
    // TODO: Implement replies functionality
    return const Center(child: Text('Replies coming soon'));
  }
}
