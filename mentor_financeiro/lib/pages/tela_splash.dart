import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  @override
  void initState() {
    super.initState();
    _iniciarApp();
  }

  Future<void> _iniciarApp() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF00D9FF),
              ),
              child: const Icon(
                Icons.account_balance_wallet,
                size: 60,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "MENTOR FINANCEIRO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 80,
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Color(0xFF1E293B),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00D9FF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
