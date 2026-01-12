part of 'tweet_bloc.dart';

@freezed
class TweetEvent with _$TweetEvent {
  const factory TweetEvent.loadTweets({
    int? limit,
    DocumentSnapshot? startAfter,
  }) = _LoadTweets;

  const factory TweetEvent.loadUserTweets({
    required String userId,
    int? limit,
    DocumentSnapshot? startAfter,
  }) = _LoadUserTweets;

  const factory TweetEvent.loadLikedTweets({
    required String userId,
    int? limit,
    DocumentSnapshot? startAfter,
  }) = _LoadLikedTweets;

  const factory TweetEvent.createTweet({required TweetModel tweet}) =
      _CreateTweet;

  const factory TweetEvent.deleteTweet({required String tweetId}) =
      _DeleteTweet;

  const factory TweetEvent.likeTweet({
    required String tweetId,
    required String userId,
  }) = _LikeTweet;

  const factory TweetEvent.unlikeTweet({
    required String tweetId,
    required String userId,
  }) = _UnlikeTweet;
}
