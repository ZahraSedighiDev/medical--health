import 'package:flutter/material.dart';

import '../../../core/theme/app_icons.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          ClipRRect(
            //borderRadius:  BorderRadius.circular(20),
            child: Container(
                height: 100,
                color: Colors.grey[200],
              child: Image.asset( AppIcons.doctor1),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(specialty, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(" $rating"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
