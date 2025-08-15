import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import '../graphql/graphql_documents.dart';
import '../provider//auth_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    Future<void> _signOut() async {
      final nav = Navigator.of(context);
      await authProvider.signOut();
      nav.pushReplacementNamed('/auth');
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (user?.photoURL != null)
              CircleAvatar(backgroundImage: NetworkImage(user!.photoURL!))
            else
              CircleAvatar(child: Icon(Icons.person)),

            const SizedBox(width: 10),

            Text(
              user?.displayName ?? 'Guest',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),

        actions: [
          IconButton(onPressed: _signOut, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(16)),
    );
  }
}
