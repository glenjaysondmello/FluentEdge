import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as io;

/// A custom HTTP client that adds a timeout to all requests.
class TimeoutIOClient extends http.BaseClient {
  final io.IOClient _inner;
  final Duration _timeout;

  TimeoutIOClient(this._inner, {required Duration timeout})
    : _timeout = timeout;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final responseFuture = _inner.send(request);

    // Apply timeout to both the request and the response stream.
    final response = await responseFuture.timeout(_timeout);

    // Wrap the stream to enforce timeout on data events as well.
    final timedStream = response.stream.timeout(_timeout);

    return http.StreamedResponse(
      timedStream,
      response.statusCode,
      contentLength: response.contentLength,
      request: response.request,
      headers: response.headers,
      isRedirect: response.isRedirect,
      reasonPhrase: response.reasonPhrase,
    );
  }

  @override
  void close() {
    _inner.close();
  }
}

ValueNotifier<GraphQLClient> getGraphQLClient() {
  final ioClient = io.IOClient();
  final timeoutClient = TimeoutIOClient(
    ioClient,
    timeout: const Duration(seconds: 300),
  );

  final httpLink = HttpLink(
    "https://fluentedge.onrender.com/graphql",
    defaultHeaders: {'x-apollo-operation-name': 'graphql-operation'},
    httpClient: timeoutClient,
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
