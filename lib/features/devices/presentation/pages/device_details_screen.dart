import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/features/devices/domain/entities/device_entity.dart';

class DeviceDetailsScreen extends StatelessWidget {
  static const routeName = 'device_details';
  final DeviceEntity device;

  const DeviceDetailsScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(device.category),
            Text(device.brand)
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: device.thumbnail,
            child: CachedNetworkImage(
              imageUrl: device.thumbnail,
              imageBuilder: (context, provider) => Container(
                width: MediaQuery.sizeOf(context).width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(image: provider, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: Column(
              children: [
                Text(device.title,style: Theme.of(context).textTheme.titleLarge,),
                Text(device.description,style: Theme.of(context).textTheme.bodyLarge,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price: ${device.price}\$",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                    Text("inStock: ${device.price}\$",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${device.rating}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
