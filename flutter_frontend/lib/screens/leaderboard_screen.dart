import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/leaderboard_firestore_service.dart';

const themeColors = {
  'backgroundStart': Color(0xFF2A2A72),
  'backgroundEnd': Color(0xFF009FFD),
  'card': Color(0x22FFFFFF),
  'highlightCard': Color(0x44FFFFFF),
  'text': Colors.white,
};

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  late LeaderboardFirestoreService _service;
  final String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();

    _service = Provider.of<LeaderboardFirestoreService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Global Leaderboard',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: themeColors['text'],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              themeColors['backgroundStart']!,
              themeColors['backgroundEnd']!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: _service.getLeaderboardStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Something went wrong.',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          'Leaderboard is Empty.',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    final users = snapshot.data!.docs;

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final user =
                            users[index].data() as Map<String, dynamic>;
                        final isCurrentUser = user['uid'] == currentUserId;
                        return _buildLeaderboardTile(
                          rank: index + 1,
                          name: user['displayName'] ?? 'Anonymous',
                          photoURL: user['photoURL'],
                          speakingScore: (user['avgSpeakingScore'] as num)
                              .toDouble(),
                          typingScore: (user['avgTypingScore'] as num)
                              .toDouble(),
                          rankingScore: (user['rankingScore'] as num).toInt(),
                          isCurrentUser: isCurrentUser,
                        );
                      },
                      itemCount: users.length,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    );
                  },
                ),
              ),
              _buildCurrentUserCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardTile({
    required int rank,
    required String name,
    String? photoURL,
    required double speakingScore,
    required double typingScore,
    required int rankingScore,
    required bool isCurrentUser,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? themeColors['highlightCard']
            : themeColors['card'],
        borderRadius: BorderRadius.circular(16),
        border: isCurrentUser
            ? Border.all(color: Colors.white.withAlpha(150), width: 2)
            : null,
      ),

      child: Row(
        children: [
          _buildRankIndicator(rank: rank),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white24,
            backgroundImage: photoURL != null ? NetworkImage(photoURL) : null,
            child: photoURL == null
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Speaking: ${speakingScore.toStringAsFixed(1)} | Typing: ${typingScore.toStringAsFixed(1)}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            rankingScore.toString(),
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankIndicator({required int rank}) {
    IconData? icon;
    Color? color;

    if (rank == 1) {
      icon = Icons.emoji_events;
      color = const Color(0xFFFFD700);
    } else if (rank == 2) {
      icon = Icons.emoji_events;
      color = const Color(0xFFC0C0C0);
    } else if (rank == 3) {
      icon = Icons.emoji_events;
      color = const Color(0xFFCD7F32);
    }

    return SizedBox(
      width: 30,
      child: icon != null
          ? Icon(icon, color: color, size: 30)
          : Text(
              rank.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white54,
              ),
            ),
    );
  }

  Widget _buildCurrentUserCard() {
    return FutureBuilder(
      future: _service.getCurrentUserRank(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const SizedBox.shrink();
        }

        final user = snapshot.data!;
        final rank = user['rank'];
        final score = (user['rankingScore'] as num).toInt();

        return Container(
          margin: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(230),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(25), blurRadius: 10),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Rank",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: themeColors['backgroundStart'],
                  fontSize: 16,
                ),
              ),
              Text(
                '#$rank ($score pts)',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: themeColors['backgroundEnd'],
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
