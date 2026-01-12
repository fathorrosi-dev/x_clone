import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TweetModel extends Equatable {
  final String tweetId;
  final String userId;
  final String tweetContent;
  final int likesCount;
  final int commentsCount;
  final DateTime createdAt;
  final String? userDisplayName;
  final String? userPhotoUrl;

  const TweetModel({
    required this.tweetId,
    required this.userId,
    required this.tweetContent,
    this.likesCount = 0,
    this.commentsCount = 0,
    required this.createdAt,
    this.userDisplayName,
    this.userPhotoUrl,
  });

  factory TweetModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TweetModel(
      tweetId: doc.id,
      userId: data['userId'] as String,
      tweetContent: data['tweetContent'] as String,
      likesCount: data['likesCount'] as int? ?? 0,
      commentsCount: data['commentsCount'] as int? ?? 0,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      userDisplayName: data['userDisplayName'] as String?,
      userPhotoUrl: data['userPhotoUrl'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'tweetContent': tweetContent,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'userDisplayName': userDisplayName,
      'userPhotoUrl': userPhotoUrl,
    };
  }

  TweetModel copyWith({
    String? tweetId,
    String? userId,
    String? tweetContent,
    int? likesCount,
    int? commentsCount,
    DateTime? createdAt,
    String? userDisplayName,
    String? userPhotoUrl,
  }) {
    return TweetModel(
      tweetId: tweetId ?? this.tweetId,
      userId: userId ?? this.userId,
      tweetContent: tweetContent ?? this.tweetContent,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      createdAt: createdAt ?? this.createdAt,
      userDisplayName: userDisplayName ?? this.userDisplayName,
      userPhotoUrl: userPhotoUrl ?? this.userPhotoUrl,
    );
  }

  @override
  List<Object?> get props => [
    tweetId,
    userId,
    tweetContent,
    likesCount,
    commentsCount,
    createdAt,
    userDisplayName,
    userPhotoUrl,
  ];
}
