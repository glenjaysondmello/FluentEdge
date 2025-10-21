import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

/// A custom HTTP client that adds a timeout to all requests.
class TimeoutClient extends http.BaseClient {
  final http.Client _inner;
  final Duration _timeout;

  TimeoutClient({required Duration timeout})
    : _inner = http.Client(),
      _timeout = timeout;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // For every request, apply the timeout.
    return _inner.send(request).timeout(_timeout);
  }
}

ValueNotifier<GraphQLClient> getGraphQLClient() {
  final httpClient = TimeoutClient(timeout: Duration(seconds: 1000));

  final httpLink = HttpLink(
    "https://fluentedge.onrender.com/graphql",
    defaultHeaders: {'x-apollo-operation-name': 'UploadFile'},
    httpClient: httpClient,
  );

  final authLink = AuthLink(
    getToken: () async {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final token = await user.getIdToken();
        return 'Bearer $token';
      }

      return null;
    },
  );

  final link = authLink.concat(httpLink);

  return ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
}
