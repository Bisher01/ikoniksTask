import 'package:flutter/material.dart';

enum ToastStatus { success, fail, warning }

class AppToast extends StatelessWidget {
  final String title;
  final String message;
  final ToastStatus status;

  const AppToast({
    Key? key,
    required this.title,
    required this.message,
    this.status = ToastStatus.success,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: status == ToastStatus.success
            ? Colors.green
            : status == ToastStatus.warning
            ? Colors.amber
            : Colors.red,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
