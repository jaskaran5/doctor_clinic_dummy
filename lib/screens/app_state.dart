import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class AppState extends StatefulWidget {
  final Widget child;

  const AppState({super.key, required this.child});

  static App of(BuildContext context) {
    final inherited = context
        .dependOnInheritedWidgetOfExactType<_AppStateInherited>();
    return inherited!.data;
  }

  @override
  State<AppState> createState() => App();
}

class App extends State<AppState> {
  bool isDoctorAvailable = false;

  List<Map<String, String>> users = [];
  int currentIndex = -1;

  Timer? timer;
  final Random random = Random();

  // 🔄 Toggle doctor
  void updateAvailability(bool value) {
    setState(() {
      isDoctorAvailable = value;
    });
  }

  // ➕ Add user with token
  bool addUser(String name, String phoneNumber) {
    if (!isDoctorAvailable) return false;

    int token;
    do {
      token = random.nextInt(900) + 100;
    } while (users.any((u) => u["token"] == token.toString()));

    setState(() {
      users.add({
        "name": name,
        "phoneNumber": phoneNumber,
        "token": token.toString(),
        "status": "waiting",
      });
    });

    if (currentIndex == -1) {
      moveToNextPatient();
    }

    return true;
  }

  // ⏭️ Next patient
  void moveToNextPatient() {
    setState(() {
      if (currentIndex >= 0 && currentIndex < users.length) {
        users[currentIndex]["status"] = "done";
      }

      currentIndex++;

      if (currentIndex < users.length) {
        users[currentIndex]["status"] = "current";
      }
    });

    startTimer();
  }

  // ⏱️ Auto every 3 minutes
  void startTimer() {
    timer?.cancel();

    timer = Timer(const Duration(seconds: 10), () {
      if (currentIndex < users.length) {
        moveToNextPatient();
      }
    });
  }

  // 🔄 Reset
  void resetQueue() {
    timer?.cancel();

    setState(() {
      users.clear();
      currentIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AppStateInherited(data: this, child: widget.child);
  }
}

class _AppStateInherited extends InheritedWidget {
  final App data;

  const _AppStateInherited({required this.data, required super.child});

  @override
  bool updateShouldNotify(_) => true;
}
