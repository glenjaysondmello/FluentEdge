import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql/graphql_documents.dart';
import '../widgets/mood_picker.dart';
import '../models/mood_type.dart';
import 'package:intl/intl.dart';

class LogMoodScreen extends StatefulWidget {
  const LogMoodScreen({super.key});

  @override
  State<LogMoodScreen> createState() => _LogMoodScreenState();
}

class _LogMoodScreenState extends State<LogMoodScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
