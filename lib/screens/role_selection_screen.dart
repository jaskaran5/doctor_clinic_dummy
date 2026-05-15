import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'clinic_list_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  void navigate(BuildContext context, String role) {
    if (role == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SplashScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ClinicListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => navigate(context, 'admin'),
              child: const Text("Admin"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigate(context, 'patient'),
              child: const Text("Patient"),
            ),
          ],
        ),
      ),
    );
  }
}
