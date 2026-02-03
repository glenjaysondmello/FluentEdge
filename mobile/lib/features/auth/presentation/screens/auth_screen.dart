import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/widgets/custom_snackbar.dart';
import 'package:mobile/features/auth/data/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:mobile/core/theme/app_colors.dart';
import 'package:mobile/core/widgets/gradient_scaffold.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthProvider authProvider) async {
    if (!_formKey.currentState!.validate() || _isLoading) return;
    setState(() => _isLoading = true);

    try {
      if (_isLogin) {
        await authProvider.signIn(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      } else {
        await authProvider.signUp(
          _nameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      }
      if (mounted) Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      if (!mounted) return;
      customSnackbar(context, e.toString(), isError: true);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _googleSignIn(AuthProvider authProvider) async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await authProvider.signInWithGoogle();
      if (mounted) Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      if (mounted) {
        customSnackbar(context, e.toString(), isError: true);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return GradientScaffold(
      title: 'FluentEdge',
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:
                  [
                        Image.asset('assets/images/logo.png', height: 120),
                        const SizedBox(height: 16),
                        Text(
                          'Hone Your Skills',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.textFaded,
                          ),
                        ),
                        const SizedBox(height: 40),

                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                          child: Text(
                            _isLogin ? "Welcome Back!" : "Create Account",
                            key: ValueKey(_isLogin),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        if (!_isLogin)
                          _buildTextFormField(
                            controller: _nameController,
                            hintText: "Full Name",
                            prefixIcon: Icons.person_outline,
                            validator: (v) => (v == null || v.isEmpty)
                                ? "Enter your name"
                                : null,
                          ),
                        if (!_isLogin) const SizedBox(height: 16),

                        _buildTextFormField(
                          controller: _emailController,
                          hintText: "Email Address",
                          prefixIcon: Icons.email_outlined,
                          validator: (v) => (v == null || !v.contains('@'))
                              ? "Enter a valid email"
                              : null,
                        ),
                        const SizedBox(height: 16),
                        _buildTextFormField(
                          controller: _passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.lock_outline,
                          obscureText: true,
                          validator: (v) => (v == null || v.length < 6)
                              ? "Password must be 6+ chars"
                              : null,
                        ),
                        const SizedBox(height: 24),

                        ElevatedButton(
                          onPressed: () => _submit(authProvider),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: AppColors.accent,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 3,
                                  ),
                                )
                              : AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(
                                    _isLogin ? "LOGIN" : "SIGN UP",
                                    key: ValueKey(_isLogin),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                        ),
                        TextButton(
                          onPressed: () => setState(() => _isLogin = !_isLogin),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              _isLogin
                                  ? "Don't have an account? Sign Up"
                                  : "Already have an account? Login",
                              key: ValueKey(_isLogin),
                              style: const TextStyle(
                                color: AppColors.textFaded,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildDivider(),
                        const SizedBox(height: 20),

                        OutlinedButton.icon(
                          icon: Image.asset(
                            'assets/images/google_logo.png',
                            height: 24.0,
                          ),
                          label: Text(
                            'Sign in with Google',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.text,
                            ),
                          ),
                          onPressed: () => _googleSignIn(authProvider),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: AppColors.card,
                            side: BorderSide(color: Colors.white.withAlpha(50)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ]
                      .animate(interval: 100.ms)
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.5, curve: Curves.easeOut),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(color: AppColors.text),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.textFaded),
        prefixIcon: Icon(prefixIcon, color: AppColors.textFaded),
        filled: true,
        fillColor: AppColors.card,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accent, width: 2),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: const [
        Expanded(child: Divider(color: AppColors.textFaded)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("OR", style: TextStyle(color: AppColors.textFaded)),
        ),
        Expanded(child: Divider(color: AppColors.textFaded)),
      ],
    );
  }
}
