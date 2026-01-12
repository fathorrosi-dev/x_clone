part of 'tweet_bloc.dart';

@freezed
class TweetState with _$TweetState {
  const factory TweetState.initial() = _Initial;
  const factory TweetState.loading() = _Loading;
  const factory TweetState.loaded(List<TweetModel> tweets) = _Loaded;
  const factory TweetState.error(String message) = _Error;
  const factory TweetState.success(String message) = _Success;
}
