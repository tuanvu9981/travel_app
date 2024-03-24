import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DescriptionWhiteBox extends StatelessWidget {
  final int length;
  final String description;

  const DescriptionWhiteBox({
    super.key,
    required this.length,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12.5,
      child: Container(
        height: 170.0,
        width: 230.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$length ${AppLocalizations.of(context)!.activities}',
                style: const TextStyle(
                  fontSize: 14.5,
                  fontFamily: 'VNPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 17.5),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
