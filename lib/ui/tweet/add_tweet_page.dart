import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_clone/bloc/auth_bloc.dart';
import 'package:x_clone/bloc/tweet_bloc.dart';
import 'package:x_clone/core/core.dart';
import 'package:x_clone/models/tweet_model.dart';

class AddTweetPage extends StatefulWidget {
  const AddTweetPage({super.key});

  @override
  State<AddTweetPage> createState() => _AddTweetPageState();
}

class _AddTweetPageState extends State<AddTweetPage> {
  final _tweetController = TextEditingController();
  bool _isLoading = false;
  static const int maxLength = 280;

  @override
  void dispose() {
    _tweetController.dispose();
    super.dispose();
  }

  void _postTweet() {
    if (_tweetController.text.trim().isEmpty) return;

    setState(() => _isLoading = true);

    final authState = context.read<AuthBloc>().state;
    if (authState is! Authenticated) return;

    final tweet = TweetModel(
      tweetId: '', // Will be set by Firestore
      userId: authState.user.uid,
      tweetContent: _tweetController.text.trim(),
      createdAt: DateTime.now(),
      userDisplayName: authState.user.displayName,
      userPhotoUrl: '',
    );

    context.read<TweetBloc>().add(TweetEvent.createTweet(tweet: tweet));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TweetBloc, TweetState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (message) {
            context.pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          error: (message) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () {},
        );
      },
      child: ResponsiveScaffold(
        title: 'New Tweet',
        appBar: AppBar(
          title: const Text('New Tweet'),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.space16),
              child: FilledButton(
                onPressed: _tweetController.text.trim().isEmpty || _isLoading
                    ? null
                    : _postTweet,
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Post'),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _tweetController,
                maxLength: maxLength,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: "What's happening?",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                onChanged: (value) => setState(() {}),
              ),
            ),
            Divider(height: 1, color: context.colorScheme.outlineVariant),
            Padding(
              padding: EdgeInsets.all(context.space16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image_outlined),
                    onPressed: () {
                      // TODO: Implement image upload
                    },
                  ),
                  const Spacer(),
                  Text(
                    '${_tweetController.text.length}/$maxLength',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
