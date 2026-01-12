import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:x_clone/core/errors/failures.dart';
import 'package:x_clone/models/tweet_model.dart';

abstract class TweetRepository {
  Future<Either<Failure, List<TweetModel>>> getTweets({
    int? limit,
    DocumentSnapshot? startAfter,
  });
  Future<Either<Failure, List<TweetModel>>> getUserTweets(
    String userId, {
    int? limit,
    DocumentSnapshot? startAfter,
  });
  Future<Either<Failure, List<TweetModel>>> getLikedTweets(
    String userId, {
    int? limit,
    DocumentSnapshot? startAfter,
  });
  Future<Either<Failure, String>> createTweet(TweetModel tweet);
  Future<Either<Failure, Unit>> deleteTweet(String tweetId);
  Future<Either<Failure, Unit>> likeTweet(String tweetId, String userId);
  Future<Either<Failure, Unit>> unlikeTweet(String tweetId, String userId);
}

class TweetRepositoryImpl implements TweetRepository {
  final FirebaseFirestore _firestore;
  static const int defaultLimit = 20;

  TweetRepositoryImpl(this._firestore);

  @override
  Future<Either<Failure, List<TweetModel>>> getTweets({
    int? limit,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      var query = _firestore
          .collection('tweets')
          .orderBy('createdAt', descending: true)
          .limit(limit ?? defaultLimit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshot = await query.get();
      final tweets = snapshot.docs
          .map((doc) => TweetModel.fromFirestore(doc))
          .toList();
      return right(tweets);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<TweetModel>>> getUserTweets(
    String userId, {
    int? limit,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      var query = _firestore
          .collection('tweets')
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(limit ?? defaultLimit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshot = await query.get();
      final tweets = snapshot.docs
          .map((doc) => TweetModel.fromFirestore(doc))
          .toList();
      return right(tweets);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<TweetModel>>> getLikedTweets(
    String userId, {
    int? limit,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      var query = _firestore
          .collection('users')
          .doc(userId)
          .collection('liked_tweets')
          .orderBy('likedAt', descending: true)
          .limit(limit ?? defaultLimit);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshot = await query.get();
      final tweetIds = snapshot.docs.map((doc) => doc.id).toList();

      if (tweetIds.isEmpty) return right([]);

      final tweetsSnapshot = await _firestore
          .collection('tweets')
          .where(FieldPath.documentId, whereIn: tweetIds)
          .get();

      final tweets = tweetsSnapshot.docs
          .map((doc) => TweetModel.fromFirestore(doc))
          .toList();
      return right(tweets);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, String>> createTweet(TweetModel tweet) async {
    try {
      final docRef = await _firestore
          .collection('tweets')
          .add(tweet.toFirestore());
      return right(docRef.id);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTweet(String tweetId) async {
    try {
      await _firestore.collection('tweets').doc(tweetId).delete();
      return right(unit);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> likeTweet(String tweetId, String userId) async {
    try {
      final batch = _firestore.batch();

      // Increment likes count
      final tweetRef = _firestore.collection('tweets').doc(tweetId);
      batch.update(tweetRef, {'likesCount': FieldValue.increment(1)});

      // Add to user's liked tweets
      final likedRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('liked_tweets')
          .doc(tweetId);
      batch.set(likedRef, {'likedAt': FieldValue.serverTimestamp()});

      await batch.commit();
      return right(unit);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> unlikeTweet(
    String tweetId,
    String userId,
  ) async {
    try {
      final batch = _firestore.batch();

      // Decrement likes count
      final tweetRef = _firestore.collection('tweets').doc(tweetId);
      batch.update(tweetRef, {'likesCount': FieldValue.increment(-1)});

      // Remove from user's liked tweets
      final likedRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('liked_tweets')
          .doc(tweetId);
      batch.delete(likedRef);

      await batch.commit();
      return right(unit);
    } catch (e) {
      return left(const Failure.serverError());
    }
  }
}
