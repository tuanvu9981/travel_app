import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/models/destination.model.dart';
import 'package:travel_app/widgets/destinations/destination_card/description_white_box.dart';
import 'package:travel_app/widgets/destinations/destination_card/destination_image.dart';

class DestinationCard extends ConsumerWidget {
  final Destination destination;
  const DestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocale = ref.watch(userProvider)!.systemLanguage;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 20.0),
      width: 230.0,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          DescriptionWhiteBox(
            length: destination.activities!.length,
            description: destination.description!.get(userLocale) ?? "",
          ),
          DestinationImage(
            imageUrl: destination.imageUrl ?? "",
            city: destination.city!.get(userLocale) ?? "",
            country: destination.country!.get(userLocale) ?? "",
          )
        ],
      ),
    );
  }
}
