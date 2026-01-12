// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TweetEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)
    loadTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadUserTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadLikedTweets,
    required TResult Function(TweetModel tweet) createTweet,
    required TResult Function(String tweetId) deleteTweet,
    required TResult Function(String tweetId, String userId) likeTweet,
    required TResult Function(String tweetId, String userId) unlikeTweet,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult? Function(TweetModel tweet)? createTweet,
    TResult? Function(String tweetId)? deleteTweet,
    TResult? Function(String tweetId, String userId)? likeTweet,
    TResult? Function(String tweetId, String userId)? unlikeTweet,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult Function(TweetModel tweet)? createTweet,
    TResult Function(String tweetId)? deleteTweet,
    TResult Function(String tweetId, String userId)? likeTweet,
    TResult Function(String tweetId, String userId)? unlikeTweet,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTweets value) loadTweets,
    required TResult Function(_LoadUserTweets value) loadUserTweets,
    required TResult Function(_LoadLikedTweets value) loadLikedTweets,
    required TResult Function(_CreateTweet value) createTweet,
    required TResult Function(_DeleteTweet value) deleteTweet,
    required TResult Function(_LikeTweet value) likeTweet,
    required TResult Function(_UnlikeTweet value) unlikeTweet,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTweets value)? loadTweets,
    TResult? Function(_LoadUserTweets value)? loadUserTweets,
    TResult? Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult? Function(_CreateTweet value)? createTweet,
    TResult? Function(_DeleteTweet value)? deleteTweet,
    TResult? Function(_LikeTweet value)? likeTweet,
    TResult? Function(_UnlikeTweet value)? unlikeTweet,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTweets value)? loadTweets,
    TResult Function(_LoadUserTweets value)? loadUserTweets,
    TResult Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult Function(_CreateTweet value)? createTweet,
    TResult Function(_DeleteTweet value)? deleteTweet,
    TResult Function(_LikeTweet value)? likeTweet,
    TResult Function(_UnlikeTweet value)? unlikeTweet,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetEventCopyWith<$Res> {
  factory $TweetEventCopyWith(
    TweetEvent value,
    $Res Function(TweetEvent) then,
  ) = _$TweetEventCopyWithImpl<$Res, TweetEvent>;
}

/// @nodoc
class _$TweetEventCopyWithImpl<$Res, $Val extends TweetEvent>
    implements $TweetEventCopyWith<$Res> {
  _$TweetEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTweetsImplCopyWith<$Res> {
  factory _$$LoadTweetsImplCopyWith(
    _$LoadTweetsImpl value,
    $Res Function(_$LoadTweetsImpl) then,
  ) = __$$LoadTweetsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? limit, DocumentSnapshot<Object?>? startAfter});
}

/// @nodoc
class __$$LoadTweetsImplCopyWithImpl<$Res>
    extends _$TweetEventCopyWithImpl<$Res, _$LoadTweetsImpl>
    implements _$$LoadTweetsImplCopyWith<$Res> {
  __$$LoadTweetsImplCopyWithImpl(
    _$LoadTweetsImpl _value,
    $Res Function(_$LoadTweetsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? limit = freezed, Object? startAfter = freezed}) {
    return _then(
      _$LoadTweetsImpl(
        limit: freezed == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int?,
        startAfter: freezed == startAfter
            ? _value.startAfter
            : startAfter // ignore: cast_nullable_to_non_nullable
                  as DocumentSnapshot<Object?>?,
      ),
    );
  }
}

/// @nodoc

class _$LoadTweetsImpl implements _LoadTweets {
  const _$LoadTweetsImpl({this.limit, this.startAfter});

  @override
  final int? limit;
  @override
  final DocumentSnapshot<Object?>? startAfter;

  @override
  String toString() {
    return 'TweetEvent.loadTweets(limit: $limit, startAfter: $startAfter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTweetsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.startAfter, startAfter) ||
                other.startAfter == startAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, startAfter);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTweetsImplCopyWith<_$LoadTweetsImpl> get copyWith =>
      __$$LoadTweetsImplCopyWithImpl<_$LoadTweetsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)
    loadTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadUserTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadLikedTweets,
    required TResult Function(TweetModel tweet) createTweet,
    required TResult Function(String tweetId) deleteTweet,
    required TResult Function(String tweetId, String userId) likeTweet,
    required TResult Function(String tweetId, String userId) unlikeTweet,
  }) {
    return loadTweets(limit, startAfter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult? Function(TweetModel tweet)? createTweet,
    TResult? Function(String tweetId)? deleteTweet,
    TResult? Function(String tweetId, String userId)? likeTweet,
    TResult? Function(String tweetId, String userId)? unlikeTweet,
  }) {
    return loadTweets?.call(limit, startAfter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult Function(TweetModel tweet)? createTweet,
    TResult Function(String tweetId)? deleteTweet,
    TResult Function(String tweetId, String userId)? likeTweet,
    TResult Function(String tweetId, String userId)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (loadTweets != null) {
      return loadTweets(limit, startAfter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTweets value) loadTweets,
    required TResult Function(_LoadUserTweets value) loadUserTweets,
    required TResult Function(_LoadLikedTweets value) loadLikedTweets,
    required TResult Function(_CreateTweet value) createTweet,
    required TResult Function(_DeleteTweet value) deleteTweet,
    required TResult Function(_LikeTweet value) likeTweet,
    required TResult Function(_UnlikeTweet value) unlikeTweet,
  }) {
    return loadTweets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTweets value)? loadTweets,
    TResult? Function(_LoadUserTweets value)? loadUserTweets,
    TResult? Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult? Function(_CreateTweet value)? createTweet,
    TResult? Function(_DeleteTweet value)? deleteTweet,
    TResult? Function(_LikeTweet value)? likeTweet,
    TResult? Function(_UnlikeTweet value)? unlikeTweet,
  }) {
    return loadTweets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTweets value)? loadTweets,
    TResult Function(_LoadUserTweets value)? loadUserTweets,
    TResult Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult Function(_CreateTweet value)? createTweet,
    TResult Function(_DeleteTweet value)? deleteTweet,
    TResult Function(_LikeTweet value)? likeTweet,
    TResult Function(_UnlikeTweet value)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (loadTweets != null) {
      return loadTweets(this);
    }
    return orElse();
  }
}

abstract class _LoadTweets implements TweetEvent {
  const factory _LoadTweets({
    final int? limit,
    final DocumentSnapshot<Object?>? startAfter,
  }) = _$LoadTweetsImpl;

  int? get limit;
  DocumentSnapshot<Object?>? get startAfter;

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadTweetsImplCopyWith<_$LoadTweetsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadUserTweetsImplCopyWith<$Res> {
  factory _$$LoadUserTweetsImplCopyWith(
    _$LoadUserTweetsImpl value,
    $Res Function(_$LoadUserTweetsImpl) then,
  ) = __$$LoadUserTweetsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, int? limit, DocumentSnapshot<Object?>? startAfter});
}

/// @nodoc
class __$$LoadUserTweetsImplCopyWithImpl<$Res>
    extends _$TweetEventCopyWithImpl<$Res, _$LoadUserTweetsImpl>
    implements _$$LoadUserTweetsImplCopyWith<$Res> {
  __$$LoadUserTweetsImplCopyWithImpl(
    _$LoadUserTweetsImpl _value,
    $Res Function(_$LoadUserTweetsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? limit = freezed,
    Object? startAfter = freezed,
  }) {
    return _then(
      _$LoadUserTweetsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        limit: freezed == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int?,
        startAfter: freezed == startAfter
            ? _value.startAfter
            : startAfter // ignore: cast_nullable_to_non_nullable
                  as DocumentSnapshot<Object?>?,
      ),
    );
  }
}

/// @nodoc

class _$LoadUserTweetsImpl implements _LoadUserTweets {
  const _$LoadUserTweetsImpl({
    required this.userId,
    this.limit,
    this.startAfter,
  });

  @override
  final String userId;
  @override
  final int? limit;
  @override
  final DocumentSnapshot<Object?>? startAfter;

  @override
  String toString() {
    return 'TweetEvent.loadUserTweets(userId: $userId, limit: $limit, startAfter: $startAfter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUserTweetsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.startAfter, startAfter) ||
                other.startAfter == startAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, limit, startAfter);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUserTweetsImplCopyWith<_$LoadUserTweetsImpl> get copyWith =>
      __$$LoadUserTweetsImplCopyWithImpl<_$LoadUserTweetsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)
    loadTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadUserTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadLikedTweets,
    required TResult Function(TweetModel tweet) createTweet,
    required TResult Function(String tweetId) deleteTweet,
    required TResult Function(String tweetId, String userId) likeTweet,
    required TResult Function(String tweetId, String userId) unlikeTweet,
  }) {
    return loadUserTweets(userId, limit, startAfter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult? Function(TweetModel tweet)? createTweet,
    TResult? Function(String tweetId)? deleteTweet,
    TResult? Function(String tweetId, String userId)? likeTweet,
    TResult? Function(String tweetId, String userId)? unlikeTweet,
  }) {
    return loadUserTweets?.call(userId, limit, startAfter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult Function(TweetModel tweet)? createTweet,
    TResult Function(String tweetId)? deleteTweet,
    TResult Function(String tweetId, String userId)? likeTweet,
    TResult Function(String tweetId, String userId)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (loadUserTweets != null) {
      return loadUserTweets(userId, limit, startAfter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTweets value) loadTweets,
    required TResult Function(_LoadUserTweets value) loadUserTweets,
    required TResult Function(_LoadLikedTweets value) loadLikedTweets,
    required TResult Function(_CreateTweet value) createTweet,
    required TResult Function(_DeleteTweet value) deleteTweet,
    required TResult Function(_LikeTweet value) likeTweet,
    required TResult Function(_UnlikeTweet value) unlikeTweet,
  }) {
    return loadUserTweets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTweets value)? loadTweets,
    TResult? Function(_LoadUserTweets value)? loadUserTweets,
    TResult? Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult? Function(_CreateTweet value)? createTweet,
    TResult? Function(_DeleteTweet value)? deleteTweet,
    TResult? Function(_LikeTweet value)? likeTweet,
    TResult? Function(_UnlikeTweet value)? unlikeTweet,
  }) {
    return loadUserTweets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTweets value)? loadTweets,
    TResult Function(_LoadUserTweets value)? loadUserTweets,
    TResult Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult Function(_CreateTweet value)? createTweet,
    TResult Function(_DeleteTweet value)? deleteTweet,
    TResult Function(_LikeTweet value)? likeTweet,
    TResult Function(_UnlikeTweet value)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (loadUserTweets != null) {
      return loadUserTweets(this);
    }
    return orElse();
  }
}

abstract class _LoadUserTweets implements TweetEvent {
  const factory _LoadUserTweets({
    required final String userId,
    final int? limit,
    final DocumentSnapshot<Object?>? startAfter,
  }) = _$LoadUserTweetsImpl;

  String get userId;
  int? get limit;
  DocumentSnapshot<Object?>? get startAfter;

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUserTweetsImplCopyWith<_$LoadUserTweetsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadLikedTweetsImplCopyWith<$Res> {
  factory _$$LoadLikedTweetsImplCopyWith(
    _$LoadLikedTweetsImpl value,
    $Res Function(_$LoadLikedTweetsImpl) then,
  ) = __$$LoadLikedTweetsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, int? limit, DocumentSnapshot<Object?>? startAfter});
}

/// @nodoc
class __$$LoadLikedTweetsImplCopyWithImpl<$Res>
    extends _$TweetEventCopyWithImpl<$Res, _$LoadLikedTweetsImpl>
    implements _$$LoadLikedTweetsImplCopyWith<$Res> {
  __$$LoadLikedTweetsImplCopyWithImpl(
    _$LoadLikedTweetsImpl _value,
    $Res Function(_$LoadLikedTweetsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? limit = freezed,
    Object? startAfter = freezed,
  }) {
    return _then(
      _$LoadLikedTweetsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        limit: freezed == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int?,
        startAfter: freezed == startAfter
            ? _value.startAfter
            : startAfter // ignore: cast_nullable_to_non_nullable
                  as DocumentSnapshot<Object?>?,
      ),
    );
  }
}

/// @nodoc

class _$LoadLikedTweetsImpl implements _LoadLikedTweets {
  const _$LoadLikedTweetsImpl({
    required this.userId,
    this.limit,
    this.startAfter,
  });

  @override
  final String userId;
  @override
  final int? limit;
  @override
  final DocumentSnapshot<Object?>? startAfter;

  @override
  String toString() {
    return 'TweetEvent.loadLikedTweets(userId: $userId, limit: $limit, startAfter: $startAfter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadLikedTweetsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.startAfter, startAfter) ||
                other.startAfter == startAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, limit, startAfter);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadLikedTweetsImplCopyWith<_$LoadLikedTweetsImpl> get copyWith =>
      __$$LoadLikedTweetsImplCopyWithImpl<_$LoadLikedTweetsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)
    loadTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadUserTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadLikedTweets,
    required TResult Function(TweetModel tweet) createTweet,
    required TResult Function(String tweetId) deleteTweet,
    required TResult Function(String tweetId, String userId) likeTweet,
    required TResult Function(String tweetId, String userId) unlikeTweet,
  }) {
    return loadLikedTweets(userId, limit, startAfter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult? Function(TweetModel tweet)? createTweet,
    TResult? Function(String tweetId)? deleteTweet,
    TResult? Function(String tweetId, String userId)? likeTweet,
    TResult? Function(String tweetId, String userId)? unlikeTweet,
  }) {
    return loadLikedTweets?.call(userId, limit, startAfter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult Function(TweetModel tweet)? createTweet,
    TResult Function(String tweetId)? deleteTweet,
    TResult Function(String tweetId, String userId)? likeTweet,
    TResult Function(String tweetId, String userId)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (loadLikedTweets != null) {
      return loadLikedTweets(userId, limit, startAfter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTweets value) loadTweets,
    required TResult Function(_LoadUserTweets value) loadUserTweets,
    required TResult Function(_LoadLikedTweets value) loadLikedTweets,
    required TResult Function(_CreateTweet value) createTweet,
    required TResult Function(_DeleteTweet value) deleteTweet,
    required TResult Function(_LikeTweet value) likeTweet,
    required TResult Function(_UnlikeTweet value) unlikeTweet,
  }) {
    return loadLikedTweets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTweets value)? loadTweets,
    TResult? Function(_LoadUserTweets value)? loadUserTweets,
    TResult? Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult? Function(_CreateTweet value)? createTweet,
    TResult? Function(_DeleteTweet value)? deleteTweet,
    TResult? Function(_LikeTweet value)? likeTweet,
    TResult? Function(_UnlikeTweet value)? unlikeTweet,
  }) {
    return loadLikedTweets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTweets value)? loadTweets,
    TResult Function(_LoadUserTweets value)? loadUserTweets,
    TResult Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult Function(_CreateTweet value)? createTweet,
    TResult Function(_DeleteTweet value)? deleteTweet,
    TResult Function(_LikeTweet value)? likeTweet,
    TResult Function(_UnlikeTweet value)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (loadLikedTweets != null) {
      return loadLikedTweets(this);
    }
    return orElse();
  }
}

abstract class _LoadLikedTweets implements TweetEvent {
  const factory _LoadLikedTweets({
    required final String userId,
    final int? limit,
    final DocumentSnapshot<Object?>? startAfter,
  }) = _$LoadLikedTweetsImpl;

  String get userId;
  int? get limit;
  DocumentSnapshot<Object?>? get startAfter;

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadLikedTweetsImplCopyWith<_$LoadLikedTweetsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTweetImplCopyWith<$Res> {
  factory _$$CreateTweetImplCopyWith(
    _$CreateTweetImpl value,
    $Res Function(_$CreateTweetImpl) then,
  ) = __$$CreateTweetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TweetModel tweet});
}

/// @nodoc
class __$$CreateTweetImplCopyWithImpl<$Res>
    extends _$TweetEventCopyWithImpl<$Res, _$CreateTweetImpl>
    implements _$$CreateTweetImplCopyWith<$Res> {
  __$$CreateTweetImplCopyWithImpl(
    _$CreateTweetImpl _value,
    $Res Function(_$CreateTweetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tweet = null}) {
    return _then(
      _$CreateTweetImpl(
        tweet: null == tweet
            ? _value.tweet
            : tweet // ignore: cast_nullable_to_non_nullable
                  as TweetModel,
      ),
    );
  }
}

/// @nodoc

class _$CreateTweetImpl implements _CreateTweet {
  const _$CreateTweetImpl({required this.tweet});

  @override
  final TweetModel tweet;

  @override
  String toString() {
    return 'TweetEvent.createTweet(tweet: $tweet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTweetImpl &&
            (identical(other.tweet, tweet) || other.tweet == tweet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tweet);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTweetImplCopyWith<_$CreateTweetImpl> get copyWith =>
      __$$CreateTweetImplCopyWithImpl<_$CreateTweetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)
    loadTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadUserTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadLikedTweets,
    required TResult Function(TweetModel tweet) createTweet,
    required TResult Function(String tweetId) deleteTweet,
    required TResult Function(String tweetId, String userId) likeTweet,
    required TResult Function(String tweetId, String userId) unlikeTweet,
  }) {
    return createTweet(tweet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult? Function(TweetModel tweet)? createTweet,
    TResult? Function(String tweetId)? deleteTweet,
    TResult? Function(String tweetId, String userId)? likeTweet,
    TResult? Function(String tweetId, String userId)? unlikeTweet,
  }) {
    return createTweet?.call(tweet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult Function(TweetModel tweet)? createTweet,
    TResult Function(String tweetId)? deleteTweet,
    TResult Function(String tweetId, String userId)? likeTweet,
    TResult Function(String tweetId, String userId)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (createTweet != null) {
      return createTweet(tweet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTweets value) loadTweets,
    required TResult Function(_LoadUserTweets value) loadUserTweets,
    required TResult Function(_LoadLikedTweets value) loadLikedTweets,
    required TResult Function(_CreateTweet value) createTweet,
    required TResult Function(_DeleteTweet value) deleteTweet,
    required TResult Function(_LikeTweet value) likeTweet,
    required TResult Function(_UnlikeTweet value) unlikeTweet,
  }) {
    return createTweet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTweets value)? loadTweets,
    TResult? Function(_LoadUserTweets value)? loadUserTweets,
    TResult? Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult? Function(_CreateTweet value)? createTweet,
    TResult? Function(_DeleteTweet value)? deleteTweet,
    TResult? Function(_LikeTweet value)? likeTweet,
    TResult? Function(_UnlikeTweet value)? unlikeTweet,
  }) {
    return createTweet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTweets value)? loadTweets,
    TResult Function(_LoadUserTweets value)? loadUserTweets,
    TResult Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult Function(_CreateTweet value)? createTweet,
    TResult Function(_DeleteTweet value)? deleteTweet,
    TResult Function(_LikeTweet value)? likeTweet,
    TResult Function(_UnlikeTweet value)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (createTweet != null) {
      return createTweet(this);
    }
    return orElse();
  }
}

abstract class _CreateTweet implements TweetEvent {
  const factory _CreateTweet({required final TweetModel tweet}) =
      _$CreateTweetImpl;

  TweetModel get tweet;

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTweetImplCopyWith<_$CreateTweetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTweetImplCopyWith<$Res> {
  factory _$$DeleteTweetImplCopyWith(
    _$DeleteTweetImpl value,
    $Res Function(_$DeleteTweetImpl) then,
  ) = __$$DeleteTweetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tweetId});
}

/// @nodoc
class __$$DeleteTweetImplCopyWithImpl<$Res>
    extends _$TweetEventCopyWithImpl<$Res, _$DeleteTweetImpl>
    implements _$$DeleteTweetImplCopyWith<$Res> {
  __$$DeleteTweetImplCopyWithImpl(
    _$DeleteTweetImpl _value,
    $Res Function(_$DeleteTweetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tweetId = null}) {
    return _then(
      _$DeleteTweetImpl(
        tweetId: null == tweetId
            ? _value.tweetId
            : tweetId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteTweetImpl implements _DeleteTweet {
  const _$DeleteTweetImpl({required this.tweetId});

  @override
  final String tweetId;

  @override
  String toString() {
    return 'TweetEvent.deleteTweet(tweetId: $tweetId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTweetImpl &&
            (identical(other.tweetId, tweetId) || other.tweetId == tweetId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tweetId);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTweetImplCopyWith<_$DeleteTweetImpl> get copyWith =>
      __$$DeleteTweetImplCopyWithImpl<_$DeleteTweetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)
    loadTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadUserTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadLikedTweets,
    required TResult Function(TweetModel tweet) createTweet,
    required TResult Function(String tweetId) deleteTweet,
    required TResult Function(String tweetId, String userId) likeTweet,
    required TResult Function(String tweetId, String userId) unlikeTweet,
  }) {
    return deleteTweet(tweetId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult? Function(TweetModel tweet)? createTweet,
    TResult? Function(String tweetId)? deleteTweet,
    TResult? Function(String tweetId, String userId)? likeTweet,
    TResult? Function(String tweetId, String userId)? unlikeTweet,
  }) {
    return deleteTweet?.call(tweetId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult Function(TweetModel tweet)? createTweet,
    TResult Function(String tweetId)? deleteTweet,
    TResult Function(String tweetId, String userId)? likeTweet,
    TResult Function(String tweetId, String userId)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (deleteTweet != null) {
      return deleteTweet(tweetId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTweets value) loadTweets,
    required TResult Function(_LoadUserTweets value) loadUserTweets,
    required TResult Function(_LoadLikedTweets value) loadLikedTweets,
    required TResult Function(_CreateTweet value) createTweet,
    required TResult Function(_DeleteTweet value) deleteTweet,
    required TResult Function(_LikeTweet value) likeTweet,
    required TResult Function(_UnlikeTweet value) unlikeTweet,
  }) {
    return deleteTweet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTweets value)? loadTweets,
    TResult? Function(_LoadUserTweets value)? loadUserTweets,
    TResult? Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult? Function(_CreateTweet value)? createTweet,
    TResult? Function(_DeleteTweet value)? deleteTweet,
    TResult? Function(_LikeTweet value)? likeTweet,
    TResult? Function(_UnlikeTweet value)? unlikeTweet,
  }) {
    return deleteTweet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTweets value)? loadTweets,
    TResult Function(_LoadUserTweets value)? loadUserTweets,
    TResult Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult Function(_CreateTweet value)? createTweet,
    TResult Function(_DeleteTweet value)? deleteTweet,
    TResult Function(_LikeTweet value)? likeTweet,
    TResult Function(_UnlikeTweet value)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (deleteTweet != null) {
      return deleteTweet(this);
    }
    return orElse();
  }
}

abstract class _DeleteTweet implements TweetEvent {
  const factory _DeleteTweet({required final String tweetId}) =
      _$DeleteTweetImpl;

  String get tweetId;

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteTweetImplCopyWith<_$DeleteTweetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikeTweetImplCopyWith<$Res> {
  factory _$$LikeTweetImplCopyWith(
    _$LikeTweetImpl value,
    $Res Function(_$LikeTweetImpl) then,
  ) = __$$LikeTweetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tweetId, String userId});
}

/// @nodoc
class __$$LikeTweetImplCopyWithImpl<$Res>
    extends _$TweetEventCopyWithImpl<$Res, _$LikeTweetImpl>
    implements _$$LikeTweetImplCopyWith<$Res> {
  __$$LikeTweetImplCopyWithImpl(
    _$LikeTweetImpl _value,
    $Res Function(_$LikeTweetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tweetId = null, Object? userId = null}) {
    return _then(
      _$LikeTweetImpl(
        tweetId: null == tweetId
            ? _value.tweetId
            : tweetId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LikeTweetImpl implements _LikeTweet {
  const _$LikeTweetImpl({required this.tweetId, required this.userId});

  @override
  final String tweetId;
  @override
  final String userId;

  @override
  String toString() {
    return 'TweetEvent.likeTweet(tweetId: $tweetId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeTweetImpl &&
            (identical(other.tweetId, tweetId) || other.tweetId == tweetId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tweetId, userId);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeTweetImplCopyWith<_$LikeTweetImpl> get copyWith =>
      __$$LikeTweetImplCopyWithImpl<_$LikeTweetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)
    loadTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadUserTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadLikedTweets,
    required TResult Function(TweetModel tweet) createTweet,
    required TResult Function(String tweetId) deleteTweet,
    required TResult Function(String tweetId, String userId) likeTweet,
    required TResult Function(String tweetId, String userId) unlikeTweet,
  }) {
    return likeTweet(tweetId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult? Function(TweetModel tweet)? createTweet,
    TResult? Function(String tweetId)? deleteTweet,
    TResult? Function(String tweetId, String userId)? likeTweet,
    TResult? Function(String tweetId, String userId)? unlikeTweet,
  }) {
    return likeTweet?.call(tweetId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult Function(TweetModel tweet)? createTweet,
    TResult Function(String tweetId)? deleteTweet,
    TResult Function(String tweetId, String userId)? likeTweet,
    TResult Function(String tweetId, String userId)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (likeTweet != null) {
      return likeTweet(tweetId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTweets value) loadTweets,
    required TResult Function(_LoadUserTweets value) loadUserTweets,
    required TResult Function(_LoadLikedTweets value) loadLikedTweets,
    required TResult Function(_CreateTweet value) createTweet,
    required TResult Function(_DeleteTweet value) deleteTweet,
    required TResult Function(_LikeTweet value) likeTweet,
    required TResult Function(_UnlikeTweet value) unlikeTweet,
  }) {
    return likeTweet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTweets value)? loadTweets,
    TResult? Function(_LoadUserTweets value)? loadUserTweets,
    TResult? Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult? Function(_CreateTweet value)? createTweet,
    TResult? Function(_DeleteTweet value)? deleteTweet,
    TResult? Function(_LikeTweet value)? likeTweet,
    TResult? Function(_UnlikeTweet value)? unlikeTweet,
  }) {
    return likeTweet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTweets value)? loadTweets,
    TResult Function(_LoadUserTweets value)? loadUserTweets,
    TResult Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult Function(_CreateTweet value)? createTweet,
    TResult Function(_DeleteTweet value)? deleteTweet,
    TResult Function(_LikeTweet value)? likeTweet,
    TResult Function(_UnlikeTweet value)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (likeTweet != null) {
      return likeTweet(this);
    }
    return orElse();
  }
}

abstract class _LikeTweet implements TweetEvent {
  const factory _LikeTweet({
    required final String tweetId,
    required final String userId,
  }) = _$LikeTweetImpl;

  String get tweetId;
  String get userId;

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeTweetImplCopyWith<_$LikeTweetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnlikeTweetImplCopyWith<$Res> {
  factory _$$UnlikeTweetImplCopyWith(
    _$UnlikeTweetImpl value,
    $Res Function(_$UnlikeTweetImpl) then,
  ) = __$$UnlikeTweetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tweetId, String userId});
}

/// @nodoc
class __$$UnlikeTweetImplCopyWithImpl<$Res>
    extends _$TweetEventCopyWithImpl<$Res, _$UnlikeTweetImpl>
    implements _$$UnlikeTweetImplCopyWith<$Res> {
  __$$UnlikeTweetImplCopyWithImpl(
    _$UnlikeTweetImpl _value,
    $Res Function(_$UnlikeTweetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tweetId = null, Object? userId = null}) {
    return _then(
      _$UnlikeTweetImpl(
        tweetId: null == tweetId
            ? _value.tweetId
            : tweetId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnlikeTweetImpl implements _UnlikeTweet {
  const _$UnlikeTweetImpl({required this.tweetId, required this.userId});

  @override
  final String tweetId;
  @override
  final String userId;

  @override
  String toString() {
    return 'TweetEvent.unlikeTweet(tweetId: $tweetId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlikeTweetImpl &&
            (identical(other.tweetId, tweetId) || other.tweetId == tweetId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tweetId, userId);

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlikeTweetImplCopyWith<_$UnlikeTweetImpl> get copyWith =>
      __$$UnlikeTweetImplCopyWithImpl<_$UnlikeTweetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)
    loadTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadUserTweets,
    required TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )
    loadLikedTweets,
    required TResult Function(TweetModel tweet) createTweet,
    required TResult Function(String tweetId) deleteTweet,
    required TResult Function(String tweetId, String userId) likeTweet,
    required TResult Function(String tweetId, String userId) unlikeTweet,
  }) {
    return unlikeTweet(tweetId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult? Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult? Function(TweetModel tweet)? createTweet,
    TResult? Function(String tweetId)? deleteTweet,
    TResult? Function(String tweetId, String userId)? likeTweet,
    TResult? Function(String tweetId, String userId)? unlikeTweet,
  }) {
    return unlikeTweet?.call(tweetId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? limit, DocumentSnapshot<Object?>? startAfter)?
    loadTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadUserTweets,
    TResult Function(
      String userId,
      int? limit,
      DocumentSnapshot<Object?>? startAfter,
    )?
    loadLikedTweets,
    TResult Function(TweetModel tweet)? createTweet,
    TResult Function(String tweetId)? deleteTweet,
    TResult Function(String tweetId, String userId)? likeTweet,
    TResult Function(String tweetId, String userId)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (unlikeTweet != null) {
      return unlikeTweet(tweetId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTweets value) loadTweets,
    required TResult Function(_LoadUserTweets value) loadUserTweets,
    required TResult Function(_LoadLikedTweets value) loadLikedTweets,
    required TResult Function(_CreateTweet value) createTweet,
    required TResult Function(_DeleteTweet value) deleteTweet,
    required TResult Function(_LikeTweet value) likeTweet,
    required TResult Function(_UnlikeTweet value) unlikeTweet,
  }) {
    return unlikeTweet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadTweets value)? loadTweets,
    TResult? Function(_LoadUserTweets value)? loadUserTweets,
    TResult? Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult? Function(_CreateTweet value)? createTweet,
    TResult? Function(_DeleteTweet value)? deleteTweet,
    TResult? Function(_LikeTweet value)? likeTweet,
    TResult? Function(_UnlikeTweet value)? unlikeTweet,
  }) {
    return unlikeTweet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTweets value)? loadTweets,
    TResult Function(_LoadUserTweets value)? loadUserTweets,
    TResult Function(_LoadLikedTweets value)? loadLikedTweets,
    TResult Function(_CreateTweet value)? createTweet,
    TResult Function(_DeleteTweet value)? deleteTweet,
    TResult Function(_LikeTweet value)? likeTweet,
    TResult Function(_UnlikeTweet value)? unlikeTweet,
    required TResult orElse(),
  }) {
    if (unlikeTweet != null) {
      return unlikeTweet(this);
    }
    return orElse();
  }
}

abstract class _UnlikeTweet implements TweetEvent {
  const factory _UnlikeTweet({
    required final String tweetId,
    required final String userId,
  }) = _$UnlikeTweetImpl;

  String get tweetId;
  String get userId;

  /// Create a copy of TweetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlikeTweetImplCopyWith<_$UnlikeTweetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TweetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TweetModel> tweets) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TweetModel> tweets)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TweetModel> tweets)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetStateCopyWith<$Res> {
  factory $TweetStateCopyWith(
    TweetState value,
    $Res Function(TweetState) then,
  ) = _$TweetStateCopyWithImpl<$Res, TweetState>;
}

/// @nodoc
class _$TweetStateCopyWithImpl<$Res, $Val extends TweetState>
    implements $TweetStateCopyWith<$Res> {
  _$TweetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TweetStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TweetState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TweetModel> tweets) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TweetModel> tweets)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TweetModel> tweets)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TweetState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TweetStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TweetState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TweetModel> tweets) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TweetModel> tweets)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TweetModel> tweets)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TweetState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TweetModel> tweets});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$TweetStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tweets = null}) {
    return _then(
      _$LoadedImpl(
        null == tweets
            ? _value._tweets
            : tweets // ignore: cast_nullable_to_non_nullable
                  as List<TweetModel>,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<TweetModel> tweets) : _tweets = tweets;

  final List<TweetModel> _tweets;
  @override
  List<TweetModel> get tweets {
    if (_tweets is EqualUnmodifiableListView) return _tweets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tweets);
  }

  @override
  String toString() {
    return 'TweetState.loaded(tweets: $tweets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._tweets, _tweets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tweets));

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TweetModel> tweets) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return loaded(tweets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TweetModel> tweets)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return loaded?.call(tweets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TweetModel> tweets)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tweets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements TweetState {
  const factory _Loaded(final List<TweetModel> tweets) = _$LoadedImpl;

  List<TweetModel> get tweets;

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$TweetStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TweetState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TweetModel> tweets) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TweetModel> tweets)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TweetModel> tweets)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements TweetState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$TweetStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SuccessImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TweetState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TweetModel> tweets) loaded,
    required TResult Function(String message) error,
    required TResult Function(String message) success,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TweetModel> tweets)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(String message)? success,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TweetModel> tweets)? loaded,
    TResult Function(String message)? error,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements TweetState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;

  /// Create a copy of TweetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
