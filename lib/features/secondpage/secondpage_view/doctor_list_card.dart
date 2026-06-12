import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class DoctorListCard extends StatefulWidget {
  final String name;
  final String specialty;
  final double rating;
  final String imageUrl;
  final String address;
  final List<String> availableTimes; // زمان‌های خالی اضافه شد

  const DoctorListCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.imageUrl,
    required this.address,
    this.availableTimes = const [], // مقدار پیش‌فرض
  });

  @override
  State<DoctorListCard> createState() => _DoctorListCardState();
}
class _DoctorListCardState extends State<DoctorListCard> {
  String? _selectedTime; // زمان انتخاب شده

  @override
  void initState() {
    super.initState();
    if (widget.availableTimes.isNotEmpty) {
      _selectedTime = widget.availableTimes.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.imageUrl,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.specialty,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text("${widget.rating}"),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            widget.address,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // فاصله بین اطلاعات دکتر و بخش زمان/رزرو

          // بخش زمان و رزرو
          if (widget.availableTimes.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey[700], size: 20),
                  const SizedBox(width: 8),
                  Text("Available: ${_selectedTime ?? 'Select Time'}"),
                  const Spacer(), // این هم Push میکنه دکمه Reserve رو به راست
              ElevatedButton(
                onPressed: _selectedTime == null
                    ? null
                    : () {
                  // 1. نمایش پیام به کاربر با استفاده از GetX
                  Get.snackbar(
                    "Success", // عنوان پیام
                    "Appointment with ${widget.name} at $_selectedTime booked successfully!", // متن پیام
                    snackPosition: SnackPosition.BOTTOM, // موقعیت نمایش
                    backgroundColor: Colors.green.withValues(alpha: 0.8),
                    colorText: Colors.white,
                    duration: const Duration(seconds: 3),
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                  );
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Reserve"),
              ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
