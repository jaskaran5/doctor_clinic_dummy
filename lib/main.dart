import 'package:doctor_clinic_dummy/screens/app_state.dart';
import 'package:flutter/material.dart';
import 'screens/role_selection_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AppState(
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        home: RoleSelectionScreen(),
      ),
    );
  }
}
