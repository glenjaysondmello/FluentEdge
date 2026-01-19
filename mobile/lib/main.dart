import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/network/graphql_client.dart';
import 'package:mobile/features/leaderboard/data/services/leaderboard_firestore_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'firebase_options.dart';
import 'features/auth/presentation/screens/auth_screen.dart';
import 'presentation/splash/splash_screen.dart';
import 'features/auth/data/services/firebase_auth_service.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initHiveForFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LeaderboardFirestoreService()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          final client = getGraphQLClient();

          return GraphQLProvider(
            client: client,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "FluentEdge",
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              initialRoute: '/',
              routes: {
                '/': (ctx) => const SplashScreen(),
                '/auth': (ctx) => const AuthScreen(),
                '/home': (ctx) => const HomeScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}
