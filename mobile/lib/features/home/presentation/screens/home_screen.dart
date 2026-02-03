import 'dart:ui'; // Needed for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/features/auth/data/services/firebase_auth_service.dart';
import 'package:mobile/features/leaderboard/presentation/screens/leaderboard_screen.dart';
import 'package:mobile/features/speaking/presentation/screens/speaking_screen.dart';
import 'package:mobile/features/typing/presentation/screens/typing_screen.dart';
import 'package:mobile/features/user_dashboard/presentation/screens/user_dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'package:mobile/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.text),
        actions: [
          IconButton(
            onPressed: () async {
              // Sign out logic remains the same
              if (!context.mounted) return;
              await authProvider.signOut();
              if (context.mounted) {
                Navigator.of(context).pushReplacementNamed('/auth');
              }
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Sign Out',
          ),
        ],
      ),
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.backgroundStart, AppColors.backgroundEnd],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Welcome,',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    color: AppColors.textFaded,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2),
                Text(
                  user?.displayName ?? 'Guest',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                    height: 1.2,
                  ),
                ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.2),
                const Spacer(),
                _HomePageButton(
                  icon: Icons.keyboard_alt_outlined,
                  title: 'Typing Practice',
                  subtitle: 'Test your speed and accuracy.',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TypingScreen()),
                  ),
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.3),
                const SizedBox(height: 20),
                _HomePageButton(
                  icon: Icons.mic_none_outlined,
                  title: 'Speaking Practice',
                  subtitle: 'Test your fluency and pronunciation.',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SpeakingScreen()),
                  ),
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.user;

    return ClipRRect(
      // Use ClipRRect to contain the blur effect
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      child: BackdropFilter(
        // This creates the frosted glass effect
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Drawer(
          elevation: 0,
          backgroundColor: Colors.white.withAlpha(38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. A beautiful, custom-built header
              _DrawerHeader(
                name: user?.displayName ?? 'Guest',
                email: user?.email ?? '',
                imageUrl: user?.photoURL,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    _buildDrawerItem(
                      icon: Icons.dashboard_rounded,
                      title: 'Dashboard',
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const UserDashboardScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    _buildDrawerItem(
                      icon: Icons.leaderboard,
                      title: 'Leaderboaard',
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LeaderboardScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // 2. Nicely styled navigation items
                    _buildDrawerItem(
                      icon: Icons.keyboard_alt_outlined,
                      title: 'Typing',
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TypingScreen(),
                          ),
                        );
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.mic_none_outlined,
                      title: 'Speaking',
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SpeakingScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(), // Pushes the sign out button to the bottom
              const Divider(color: Colors.white30, indent: 20, endIndent: 20),
              // 3. A clearly separated sign-out action
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: _buildDrawerItem(
                  icon: Icons.logout,
                  title: 'Sign Out',
                  onTap: () async {
                    if (!context.mounted) return;
                    await authProvider.signOut();
                    if (context.mounted) {
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil('/auth', (route) => false);
                    }
                  },
                ),
              ),
              const SizedBox(height: 20), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 26),
      title: Text(
        title,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      horizontalTitleGap: 10,
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? imageUrl;

  const _DrawerHeader({required this.name, required this.email, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      decoration: BoxDecoration(color: Colors.white.withAlpha(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white24,
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
            child: imageUrl == null
                ? const Icon(Icons.person, size: 40, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 15),
          Text(
            name,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            email,
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _HomePageButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const _HomePageButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.white.withAlpha(30)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: AppColors.accent),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.textFaded,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
