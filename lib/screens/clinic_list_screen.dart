import 'package:doctor_clinic_dummy/screens/app_state.dart';
import 'package:flutter/material.dart';
import '../widgets/doctor_availability_badge.dart';

class ClinicListScreen extends StatelessWidget {
  ClinicListScreen({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    void submit() {
      final appState = AppState.of(context);

      bool success = appState.addUser(
        nameController.text,
        phoneController.text,
      );

      if (!success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Doctor not available")));
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Token generated")));

      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Clinic")),
      body: Column(
        spacing: 20,
        children: [
          DoctorAvailabilityBadge(isAvailable: appState.isDoctorAvailable),

          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Name '),
          ),
          TextField(
            controller: phoneController,

            textInputAction: .done,
            keyboardType: .number,
            decoration: InputDecoration(hintText: 'phoneNumber '),
          ),

          ElevatedButton(
            onPressed: submit,
            child: const Text("Get Your token"),
          ),
        ],
      ),
    );
  }
}
