import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DoctorAvailabilityBadge extends StatelessWidget {
  final bool isAvailable;

  const DoctorAvailabilityBadge({super.key, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isAvailable ? AppColors.available : AppColors.notAvailable,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isAvailable ? "Available" : "Not Available",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
