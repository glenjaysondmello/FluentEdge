import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LeaderboardFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late CollectionReference _leaderboardCollection = _firestore.collection(
    'leaderboard',
  );

  Future<void> updateLeaderboardEntry(Map<String, dynamic> stats) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final double avgSpeakingScore = stats['avgSpeakingScore'] ?? 0.0;
    final double avgWpm = stats['avgWpm'] ?? 0.0;
    final double avgAccuracy = stats['avgAccuracy'] ?? 0.0;
    final double totalTests = stats['totalTests'] ?? 0.0;

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
