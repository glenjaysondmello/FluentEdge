import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile/core/widgets/custom_snackbar.dart';
import 'package:mobile/features/typing/presentation/screens/typing_test_screen.dart';
import 'package:mobile/graphql/typing/typing.queries.graphql.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';

class TypingTestLauncherScreen extends StatelessWidget {
  const TypingTestLauncherScreen({super.key});

  Future<void> _startNewTest(BuildContext context) async {
    // Show a loading dialog while fetching data
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          const Center(child: CircularProgressIndicator(color: Colors.white)),
    );

    final client = GraphQLProvider.of(context).value;
    try {
      final result = await client.query(
        QueryOptions(
          document: documentNodeQueryGetTypingTestText,
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      // Dismiss the loading dialog
      if (context.mounted) Navigator.pop(context);

      if (result.hasException) {
        throw result.exception!;
      }

      final parsedData = result.data != null
          ? Query_GetTypingTestText.fromJson(result.data!)
          : null;

      final String? referenceText = parsedData?.getTypingTestText;

      if (referenceText == null) {
        throw Exception("Received null text from server");
      }

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TypingTestScreen(referenceText: referenceText),
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      // Make sure the dialog is closed even on error
      if (context.mounted && ModalRoute.of(context)?.isCurrent != true) {
        Navigator.pop(context);
      }
      if (context.mounted) {
        customSnackbar(
          context,
          "Failed to generate test text. Please try again.",
          isError: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'New Typing Test',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                    "Ready to Test Your Speed?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                      height: 1.2,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, curve: Curves.easeOut),

              const SizedBox(height: 16),

              Text(
                    "Press the button below to start a new challenge.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: AppColors.text.withAlpha(204),
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 500.ms)
                  .slideY(begin: -0.2, curve: Curves.easeOut),

              const SizedBox(height: 48),

              ElevatedButton.icon(
                    icon: const Icon(Icons.keyboard_alt_outlined, size: 28),
                    label: const Text("Start New Test"),
                    onPressed: () => _startNewTest(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          AppColors.backgroundStart, // Text/Icon color
                      backgroundColor: Colors.white, // Button background color
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black.withAlpha(77),
                      textStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 500.ms)
                  .scaleXY(begin: 0.8, curve: Curves.elasticOut),
            ],
          ),
        ),
      ),
    );
  }
}
