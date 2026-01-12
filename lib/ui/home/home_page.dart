import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/bloc/tweet_bloc.dart';
import 'package:x_clone/core/extensions/theme_insets.dart';
import 'package:x_clone/ui/home/components/app_drawer.dart';
import 'package:x_clone/ui/tweet/components/tweet_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _loadTweets();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadTweets() {
    context.read<TweetBloc>().add(const TweetEvent.loadTweets());
  }

  void _onScroll() {
    if (_isLoadingMore) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll >= (maxScroll * 0.9)) {
      setState(() => _isLoadingMore = true);
      // Load more tweets
      // TODO: Implement pagination
      setState(() => _isLoadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('H O M E')),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: BlocBuilder<TweetBloc, TweetState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (tweets) => RefreshIndicator(
                onRefresh: () async => _loadTweets(),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: tweets.length + (_isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == tweets.length) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(context.space16),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final tweet = tweets[index];
                    return TweetCard(
                      tweet: tweet,
                      onTap: () {
                        // TODO: Navigate to tweet details
                      },
                      onDelete: () {
                        context.read<TweetBloc>().add(
                          TweetEvent.deleteTweet(tweetId: tweet.tweetId),
                        );
                      },
                    );
                  },
                ),
              ),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    SizedBox(height: context.space16),
                    FilledButton(
                      onPressed: _loadTweets,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              success: (message) => const SizedBox.shrink(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-tweet'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
