// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() {
  // 1. Mock the native channel for Firebase before running tests
  setupFirebaseMock();

  testWidgets('App smoke test - verifies app launches', (
    WidgetTester tester,
  ) async {
    // 2. Mock the actual Firebase App initialization
    await Firebase.initializeApp();

    // 3. Create a mock/in-memory client for testing
    final HttpLink httpLink = HttpLink('https://test.com/graphql');
    final GraphQLClient mockClient = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );

    final ValueNotifier<GraphQLClient> clientNotifier =
        ValueNotifier<GraphQLClient>(mockClient);

    // 4. Pump the widget
    await tester.pumpWidget(MyApp(graphqlClient: clientNotifier));

    // 5. Verification
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

// Helper function to mock native platform calls
void setupFirebaseMock() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // This tells Flutter to pretend the native Firebase code is responding
  const MethodChannel channel = MethodChannel(
    'plugins.flutter.io/firebase_core',
  );
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        if (methodCall.method == 'Firebase#initializeApp') {
          return {
            'name': '[DEFAULT]',
            'options': {
              'apiKey': '123',
              'appId': '123',
              'messagingSenderId': '123',
              'projectId': '123',
            },
          };
        }
        return null;
      });
}
