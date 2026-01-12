import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/models/tweet_model.dart';
import 'package:x_clone/repositories/tweet_repository.dart';

part 'tweet_bloc.freezed.dart';
part 'tweet_event.dart';
part 'tweet_state.dart';

class TweetBloc extends Bloc<TweetEvent, TweetState> {
  final TweetRepository _tweetRepository;

  TweetBloc(this._tweetRepository) : super(const TweetState.initial()) {
    on<TweetEvent>((event, emit) async {
      await event.map(
        loadTweets: (e) => _onLoadTweets(e, emit),
        loadUserTweets: (e) => _onLoadUserTweets(e, emit),
        loadLikedTweets: (e) => _onLoadLikedTweets(e, emit),
        createTweet: (e) => _onCreateTweet(e, emit),
        deleteTweet: (e) => _onDeleteTweet(e, emit),
        likeTweet: (e) => _onLikeTweet(e, emit),
        unlikeTweet: (e) => _onUnlikeTweet(e, emit),
      );
    });
  }

  Future<void> _onLoadTweets(
    _LoadTweets event,
    Emitter<TweetState> emit,
  ) async {
    emit(const TweetState.loading());
    final result = await _tweetRepository.getTweets(
      limit: event.limit,
      startAfter: event.startAfter,
    );
    emit(
      result.fold(
        (failure) => TweetState.error(failure.toString()),
        (tweets) => TweetState.loaded(tweets),
      ),
    );
  }

  Future<void> _onLoadUserTweets(
    _LoadUserTweets event,
    Emitter<TweetState> emit,
  ) async {
    emit(const TweetState.loading());
    final result = await _tweetRepository.getUserTweets(
      event.userId,
      limit: event.limit,
      startAfter: event.startAfter,
    );
    emit(
      result.fold(
        (failure) => TweetState.error(failure.toString()),
        (tweets) => TweetState.loaded(tweets),
      ),
    );
  }

  Future<void> _onLoadLikedTweets(
    _LoadLikedTweets event,
    Emitter<TweetState> emit,
  ) async {
    emit(const TweetState.loading());
    final result = await _tweetRepository.getLikedTweets(
      event.userId,
      limit: event.limit,
      startAfter: event.startAfter,
    );
    emit(
      result.fold(
        (failure) => TweetState.error(failure.toString()),
        (tweets) => TweetState.loaded(tweets),
      ),
    );
  }

  Future<void> _onCreateTweet(
    _CreateTweet event,
    Emitter<TweetState> emit,
  ) async {
    emit(const TweetState.loading());
    final result = await _tweetRepository.createTweet(event.tweet);
    emit(
      result.fold(
        (failure) => TweetState.error(failure.toString()),
        (tweetId) => const TweetState.success('Tweet created successfully'),
      ),
    );
  }

  Future<void> _onDeleteTweet(
    _DeleteTweet event,
    Emitter<TweetState> emit,
  ) async {
    emit(const TweetState.loading());
    final result = await _tweetRepository.deleteTweet(event.tweetId);
    emit(
      result.fold(
        (failure) => TweetState.error(failure.toString()),
        (_) => const TweetState.success('Tweet deleted successfully'),
      ),
    );
  }

  Future<void> _onLikeTweet(_LikeTweet event, Emitter<TweetState> emit) async {
    final result = await _tweetRepository.likeTweet(
      event.tweetId,
      event.userId,
    );
    result.fold(
      (failure) => emit(TweetState.error(failure.toString())),
      (_) => null,
    );
  }

  Future<void> _onUnlikeTweet(
    _UnlikeTweet event,
    Emitter<TweetState> emit,
  ) async {
    final result = await _tweetRepository.unlikeTweet(
      event.tweetId,
      event.userId,
    );
    result.fold(
      (failure) => emit(TweetState.error(failure.toString())),
      (_) => null,
    );
  }
}
