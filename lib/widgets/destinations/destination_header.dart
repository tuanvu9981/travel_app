import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DestinationHeader extends StatelessWidget {
  const DestinationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Routemaster.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.topDestination,
          style: const TextStyle(
            fontSize: 18.5,
            fontFamily: 'VNPro',
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () => {
            navigator.replace('/all-destination'),
          },
          child: Text(
            AppLocalizations.of(context)!.seeAll,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              // Theme's color is NOT CONSTANT --> ALWAYS CHANGES
              fontSize: 16.5,
              fontFamily: 'VNPro',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
