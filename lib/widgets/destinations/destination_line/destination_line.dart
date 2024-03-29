import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/models/destination.model.dart';

class DestinationLine extends ConsumerWidget {
  final Destination destination;
  const DestinationLine({
    Key? key,
    required this.destination,
  }) : super(key: key);

  final _textStl = const TextStyle(
    fontSize: 15.0,
    fontFamily: 'VNPro',
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocale = ref.watch(userProvider)!.systemLanguage;
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(destination.imageUrl ?? ""),
            width: 120.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, size: 25.0, color: Colors.red),
                  const SizedBox(width: 10.0),
                  Text(
                    "${destination.city!.get(userLocale)}, ${destination.country!.get(userLocale)}",
                    style: _textStl,
                  )
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  const Icon(
                    Icons.run_circle_outlined,
                    size: 25.0,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    "${destination.activities?.length} activities",
                    style: _textStl,
                  )
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Icon(
                    Icons.house_outlined,
                    size: 25.0,
                    color: Colors.orange[300],
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    "${destination.hotels?.length} hotels",
                    style: _textStl,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
