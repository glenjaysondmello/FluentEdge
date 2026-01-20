import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile/graphql/speaking/speaking.queries.graphql.dart';
import 'package:mobile/graphql/typing/typing.queries.graphql.dart';

class LeaderboardFirestoreService with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late final CollectionReference _leaderboardCollection = _firestore.collection(
    'leaderboard',
  );

  Future<void> fetchAndUploadStats(GraphQLClient client) async {
    try {
      final resuts = await Future.wait([
        client.query(
          QueryOptions(
            document: documentNodeQueryGetSpeakingTests,
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
        client.query(
          QueryOptions(
            document: documentNodeQueryGetTypingTests,
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
      ]);

      final speakingResult = resuts[0];
      final typingResult = resuts[1];

      if (speakingResult.hasException || typingResult.hasException) {
        throw Exception("Error fetching data. Please try again.");
      }

      final speakingDataParsed = Query_GetSpeakingTests.fromJson(
        speakingResult.data!,
      );
      final typingDataParsed = Query_GetTypingTests.fromJson(
        typingResult.data!,
      );

      final speakingTests = speakingDataParsed.getSpeakingTests
          .map((e) => e.toJson())
          .toList();
      final typingTests = typingDataParsed.getTypingTests
          .map((e) => e.toJson())
          .toList();

      final calculatedStats = _calculateOverallStats(
        speakingTests,
        typingTests,
      );

      await updateLeaderboardEntry(calculatedStats);
    } catch (e) {
      print("Failed to fetch and upload stats: $e");
      rethrow;
    }
  }

  Map<String, dynamic> _calculateOverallStats(
    List<Map<String, dynamic>> speakingTests,
    List<Map<String, dynamic>> typingTests,
  ) {
    // Calculate average speaking score
    final double avgSpeakingScore = speakingTests.isNotEmpty
        ? speakingTests
                  .map<double>(
                    (t) => (t['scores']['overall'] as num).toDouble(),
                  )
                  .reduce((a, b) => a + b) /
              speakingTests.length
        : 0.0;

    // Calculate average WPM
    final double avgWpm = typingTests.isNotEmpty
        ? typingTests
                  .map<double>((t) => (t['wpm'] as num).toDouble())
                  .reduce((a, b) => a + b) /
              typingTests.length
        : 0.0;

    // Calculate average accuracy
    final double avgAccuracy = typingTests.isNotEmpty
        ? typingTests
                  .map<double>((t) => (t['accuracy'] as num).toDouble())
                  .reduce((a, b) => a + b) /
              typingTests.length
        : 0.0;

    return {
      'totalTests': speakingTests.length + typingTests.length,
      'avgSpeakingScore': avgSpeakingScore,
      'avgWpm': avgWpm,
      'avgAccuracy': avgAccuracy,
    };
  }

  Future<void> updateLeaderboardEntry(Map<String, dynamic> stats) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final double avgSpeakingScore = stats['avgSpeakingScore'] ?? 0.0;
    final double avgWpm = stats['avgWpm'] ?? 0.0;
    final double avgAccuracy = stats['avgAccuracy'] ?? 0.0;
    final int totalTests = stats['totalTests'] ?? 0.0;

    final double avgTypingScore = (avgWpm * 0.7) + (avgAccuracy * 0.3);
    final double rankingScore = (avgSpeakingScore * 10) + avgTypingScore;

    final userData = {
      'uid': user.uid,
      'displayName': user.displayName ?? 'Anonymous',
      'photoURL': user.photoURL,
      'avgSpeakingScore': avgSpeakingScore,
      'avgTypingScore': avgTypingScore,
      'totalTests': totalTests,
      'rankingScore': rankingScore,
      'lastUpdated': FieldValue.serverTimestamp(),
    };

    await _leaderboardCollection
        .doc(user.uid)
        .set(userData, SetOptions(merge: true));

    notifyListeners();
  }

  Stream<QuerySnapshot> getLeaderboardStream() {
    return _leaderboardCollection
        .orderBy('rankingScore', descending: true)
        .limit(100)
        .snapshots();
  }

  Future<Map<String, dynamic>?> getCurrentUserRank() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    final userDoc = await _leaderboardCollection.doc(user.uid).get();
    if (!userDoc.exists) return null;

    final userData = userDoc.data() as Map<String, dynamic>;
    final userScore = userData['rankingScore'];

    final snapshot = await _leaderboardCollection
        .where('rankingScore', isGreaterThan: userScore)
        .count()
        .get();

    final higherRankCount = snapshot.count;
    userData['rank'] = (higherRankCount ?? 0) + 1;

    return userData;
  }
}
