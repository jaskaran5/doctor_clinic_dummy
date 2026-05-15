import 'package:doctor_clinic_dummy/screens/app_state.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Doctor toggle
            SwitchListTile(
              title: const Text("Doctor Available"),
              value: appState.isDoctorAvailable,
              onChanged: appState.updateAvailability,
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: appState.moveToNextPatient,
                  child: const Text("Next"),
                ),
                ElevatedButton(
                  onPressed: appState.resetQueue,
                  child: const Text("Reset"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ❗ Empty list message
            if (appState.users.isEmpty) const Text("No patients in queue"),

            if (appState.users.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: appState.users.length,
                  itemBuilder: (context, index) {
                    final user = appState.users[index];
                    final status = user["status"];

                    Color color;
                    if (status == "current") {
                      color = Colors.green.shade100;
                    } else if (status == "done") {
                      color = Colors.grey.shade300;
                    } else {
                      color = Colors.white;
                    }

                    return Container(
                      color: color,
                      child: ListTile(
                        title: Text(user["name"]!),
                        subtitle: Text(user["phoneNumber"]!),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Token ${user["token"]}"),
                            Text(status!.toUpperCase()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
