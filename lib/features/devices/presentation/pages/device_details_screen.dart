import 'package:flutter/material.dart';
import 'package:task/features/devices/domain/entities/device_entity.dart';

class DeviceDetailsScreen extends StatefulWidget {
  static const routeName = 'device_details';
  final DeviceEntity device;

  const DeviceDetailsScreen({super.key, required this.device});

  @override
  State<DeviceDetailsScreen> createState() => _DeviceDetailsScreenState();
}

class _DeviceDetailsScreenState extends State<DeviceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
