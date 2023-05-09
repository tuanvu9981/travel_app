import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiscountHeader extends StatelessWidget {
  const DiscountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.discountInfo,
          style: const TextStyle(
            fontSize: 18.5,
            fontFamily: 'VNPro',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
