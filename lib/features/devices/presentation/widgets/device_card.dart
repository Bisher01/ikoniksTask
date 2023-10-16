import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/style.dart';
import '../../domain/entities/device_entity.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key, required this.device});
  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 138,
      clipBehavior: Clip.hardEdge,
      decoration: ShapeDecoration(
        color: AppStyle.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: AppStyle.shadowColor,
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 3,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: device.thumbnail,
            child: CachedNetworkImage(
              imageUrl: device.thumbnail,
              imageBuilder: (context, provider) => Container(
                width: 138,
                height: 138,
                decoration: BoxDecoration(
                  image: DecorationImage(image: provider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Container(
                width: 138,
                height: 138,
                decoration: ShapeDecoration(
                  color: AppStyle.lightGreyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Icon(
                  Icons.photo_outlined,
                  size: 40,
                  color: AppStyle.blackColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 5, start: 16, end: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.brand,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    device.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price ${device.price}"),
                      Text("in stock ${device.stock}"),
                    ],
                  ),
                  Row(
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
          )
        ],
      ),
    );
  }
}
